import 'dart:async';

import 'package:expfirebase/UiScreens/splash_services.dart';
import 'package:flutter/material.dart';

import 'login_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashScreen = SplashServices();

  void initState(){
    super.initState();
    splashScreen.isLogin(context);
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
