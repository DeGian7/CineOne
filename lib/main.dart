import 'package:cine_one/Notification/message_screen.dart';
import 'package:cine_one/Theme/blocs/preferences_bloc.dart';
import 'package:cine_one/Theme/models/preferences.dart';
import 'package:cine_one/Theme/services/preferences.service.dart';
import 'package:cine_one/Notification/push_notifications.dart';
import 'package:cine_one/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cine_one/Cinema/Bloc/cinema/cinema_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDlWYYLx2tj6amZzS3wsH5-wVcGyzpeSqo", // Your apiKey
      appId: "1:244506566292:android:c87c13899fb6dc30e71e81", // Your appId
      messagingSenderId: "", // Your messagingSenderId
      projectId: "cineone-tm",
/*       databaseURL: "https://cineone-tm-default-rtdb.firebaseio.com" */
    ),
  ); // Your projectId);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    // Context!
    PushNotification.messagesStream.listen((message) {
      // ignore: avoid_print
      print('MyApp: $message');
      navigatorKey.currentState?.pushNamed('message', arguments: message);

      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PreferencesCubit>(
      future: buildBloc(),
      builder: (context, blocSnapshot) {
        if (blocSnapshot.hasData && blocSnapshot.data != null) {
          return BlocProvider<PreferencesCubit>(
            create: (_) => blocSnapshot.data!,
            child: BlocBuilder<PreferencesCubit, Preferences> (
              builder: (context, preferences) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<CinemaBloc>(create: (context) => CinemaBloc())  
                  ], 
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'CineOne',
                    theme: ThemeData.light(),
                    darkTheme: ThemeData.dark(),
                    themeMode: preferences.themeMode,
                    initialRoute: 'home',
                    navigatorKey: navigatorKey, // Navegar
                    scaffoldMessengerKey: messengerKey, // Snacks
                    routes: {
                      'home': (_) => SplashScreen(),
                      'message': (_) => const MessageScreen(),
                    },
                  ),
                );
              },
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  Future<PreferencesCubit> buildBloc() async {
    final prefs = await SharedPreferences.getInstance();
    final service = MyPreferencesService(prefs);
    return PreferencesCubit(service, service.get());
  }
} 