import 'package:cine_one/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cine_one/Cinema/Bloc/cinema/cinema_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAEEKbl1mx4tl6GMPx8wArDT0sNoKjCTxo", // Your apiKey
      appId:
          "1:847422781853:android:88b1ca103aa3bf35689774", // Your appId1:1042125846404:android:bf9faffac086d865250fd1
      messagingSenderId: "", // Your messagingSenderId
      projectId: "mangocine",
    ),
  ); // Your projectId);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<CinemaBloc>(create: (context) => CinemaBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CineOne',
        theme: ThemeData(),
        home: SplashScreen(),
      ),
    );
  }
}

/* void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
    runApp(MyApp());
  });
}

--------------------
List usuarios = [];
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    CollectionReference collectionReference = 
        FirebaseFirestore.instance.collection("users");
    
    QuerySnapshot users = await collectionReference.get();

    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        print(doc.data());
        usuarios.add(doc.data());
      }
    }
  } */