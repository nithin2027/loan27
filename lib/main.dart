import 'package:flutter/material.dart';
import 'package:loan27/mainPage.dart';
import 'package:loan27/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Set the SplashScreen as the home screen
      routes: {
        '/signin': (context) => Signin(),
        '/mainPage': (context) => MainPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate some loading process or delay
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the Signin screen after the splash screen is displayed
      Navigator.pushReplacementNamed(context, '/signin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 52, 194, 147), // Set the background color as desired
      body: Center(
        child: Image.asset(
          'images/simpli.png', // Replace with your image file path
          width: 500,
          height: 500,
        ),
      ),
    );
  }
}
