import 'package:flutter/material.dart';

class PostLogin extends StatefulWidget {
  const PostLogin({Key? key}) : super(key: key);

  @override
  State<PostLogin> createState() => _PostLoginState();
}

class _PostLoginState extends State<PostLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: Text(
        'Post Login Screen',
        style: TextStyle(
            color: Colors.white),
      ),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Welcome to the Screen',
          style: TextStyle(
              fontSize: 30,
              color: Colors.black),
          ),
      ),
    );
  }
}
