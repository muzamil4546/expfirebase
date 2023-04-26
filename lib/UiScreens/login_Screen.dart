import 'package:expfirebase/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  FirebaseAuth _auth = FirebaseAuth.instance;

  void login(){
    _auth.signInWithEmailAndPassword(email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value){
          Utils().toastMessage(value.user!.email.toString());
    }).onError((error, stackTrace){
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
    });
  }
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
                children: [
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
                  ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Email';
                      }
                      return null;
                    },
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
                  ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 50),
            ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  login();
                }
              },
              child: Text('Login',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white)
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.purple)
              ),
            ),
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
                         color: Colors.purple,fontWeight: FontWeight.bold,
                             fontSize: 20,)
                       )
                       ]),
                  )
                ],
            ),
          ),
        ),
      ),
    );
  }
}

