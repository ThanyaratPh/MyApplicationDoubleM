import 'package:flutter/material.dart';
import 'package:flutter_application_1/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDL5neQrF-c-xTYjqkjFA2wmkg0AeS9SvU', 
      appId: '1:1049290280710:android:7030d78a37161abf9ad887', 
      messagingSenderId: '1049290280710', 
      projectId: 'doublem-91fd8'
    ),
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        brightness: Brightness.light
      ),
      home: HomeScreen(),
    );
  }
}
