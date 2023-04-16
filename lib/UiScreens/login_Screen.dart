import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';
import 'SignUp_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text('Login',
              style: TextStyle(
                  color: Colors.white,fontSize: 30)
      )
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
            children: [
              // Form(                                             form key for validation
              //     key: _formKey,
              //     child: Column()
              // ),
              Text('Login Screen',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30),
                ),
              SizedBox(height: 100),
              TextFormField(
                controller: emailController,
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
                controller: passwordController,
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
              SizedBox(height: 50),
              CustomButton(),
              SizedBox(height: 30,),
              Text.rich(
               TextSpan(
                   text: 'If you dont have an account?',style: TextStyle(fontSize: 15),
                   children: [TextSpan(
                       text: ' Sign Up',
                       recognizer: new TapGestureRecognizer()
                         ..onTap = () =>
                         {
                           Navigator.push(context, MaterialPageRoute(
                               builder: (context) => SignUp()),
                           )
                         },
                       style: TextStyle(
                     color: Colors.black,fontWeight: FontWeight.bold,
                         fontSize: 20,)
                   )
                   ]),
              )
            ],
        ),
      ),
    );
  }
}

