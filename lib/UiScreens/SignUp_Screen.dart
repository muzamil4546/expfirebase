import 'package:expfirebase/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
          title: Text('Sign Up'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SignUp Screen',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30),
            ),
          SizedBox(height: 100,),
          TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.email),
                hintText: 'Enter Email',
                labelStyle: TextStyle(
                    color: Colors.black,fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              )
          ),
          SizedBox(height: 20),
          TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.lock),
                hintText: 'Enter Password',
                labelStyle: TextStyle(
                    color: Colors.black,fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              )
          ),
            SizedBox(height: 30,),
            CustomButton(buttonTitle: 'Sign Up',),
        ],),
      ),
    );
  }
}
