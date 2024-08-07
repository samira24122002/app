import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
// ignore: depend_on_referenced_packages



void main() => runApp(MyApp()) ;

class MyApp extends StatelessWidget{
@override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 199, 201, 203),
      ),
      home: WelcomeScreen(),
    );
    
}
}