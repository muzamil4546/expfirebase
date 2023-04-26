import 'dart:async';

import 'package:expfirebase/UiScreens/login_Screen.dart';
import 'package:expfirebase/postLogin/postlogin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null){
      Timer(Duration(seconds: 2), () =>
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostLogin())));
    }else {
      Timer(Duration(seconds: 2), () =>
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen())));
    }
  }
}