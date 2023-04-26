import 'package:expfirebase/UiScreens/SignUp_Screen.dart';
import 'package:expfirebase/UiScreens/login_Screen.dart';
import 'package:expfirebase/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostLogin extends StatefulWidget {
  const PostLogin({Key? key}) : super(key: key);

  @override
  State<PostLogin> createState() => _PostLoginState();
}

class _PostLoginState extends State<PostLogin> {

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: Text(
        'Post Login Screen',
        style: TextStyle(
            color: Colors.white),
      ),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            }).onError((error, stackTrace) {
              Utils().toastMessage(error.toString());
            });
          },
              icon: Icon(Icons.logout_outlined)
          ),
          SizedBox(width: 5),
        ],
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Welcome to the post\nLogin Screen',
          style: TextStyle(
              fontSize: 30,
              color: Colors.black),
          ),
      ),
    );
  }
}
