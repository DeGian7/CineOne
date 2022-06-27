import 'package:cine_one/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cine_one/Cinema/Bloc/cinema/cinema_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDlWYYLx2tj6amZzS3wsH5-wVcGyzpeSqo", // Your apiKey
      appId: "1:244506566292:android:c87c13899fb6dc30e71e81", // Your appId
      messagingSenderId: "", // Your messagingSenderId
      projectId: "cineone-tm",
    ),
  ); // Your projectId);
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<CinemaBloc>(create: (context) => CinemaBloc())
      ], 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CineOne',
        theme: ThemeData(),
        home: SplashScreen(),
      ),
    );
  }
}