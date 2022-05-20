import 'package:flutter/material.dart';


import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:menuku/views/main_screen.dart';

class RecepiSplashScreen extends StatelessWidget {
  const RecepiSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purpleAccent[200],
        primarySwatch: Colors.deepPurple,
      ),
      home: AnimatedSplashScreen(
        splash: Column(children: [
          Image.asset('assets/icon.png'),
          const Text('Ukunem', style:  TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),),
        ]),
        backgroundColor: Colors.purple.shade200,
        nextScreen:MainScreen(),
        splashIconSize: 250,
        duration: 4000,
        splashTransition: SplashTransition.slideTransition,
        )
    );
  }
}
