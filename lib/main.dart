import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_ui/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDjylmuKBvXuGow52ofc6-UxADekGeirJM",
          authDomain: "my-foodapplication.firebaseapp.com",
          projectId: "my-foodapplication",
          storageBucket: "my-foodapplication.appspot.com",
          messagingSenderId: "1043185185585",
          appId: "1:1043185185585:web:72b392a558bc3637113610"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}
