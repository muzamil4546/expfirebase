import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'UiScreens/Splash_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: TestFirebase(),
    home: splashScreen(),
  )
  );
}

class TestFirebase extends StatefulWidget {
  const TestFirebase({Key? key}) : super(key: key);

  @override
  State<TestFirebase> createState() => _TestFirebaseState();
}

class _TestFirebaseState extends State<TestFirebase> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}