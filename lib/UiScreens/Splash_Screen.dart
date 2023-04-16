import 'dart:async';

import 'package:flutter/material.dart';

import 'login_Screen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),
        ()=> Navigator.pushReplacement(
            context, MaterialPageRoute(
            builder: (context)
            => LoginScreen(),
        )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
          child: Text('Splash Screen',
              style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold)
          )
      ),
    );
  }
}
