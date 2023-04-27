import 'package:expfirebase/utils/utils.dart';
import 'package:expfirebase/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_Screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
          title: Text('Sign Up'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('SignUp Screen',
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
                SizedBox(height: 30),
        ElevatedButton(
              onPressed: (){
                if(loading)return;
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      loading = true;
                    });
                    _auth.createUserWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString()).then((value){
                      setState(() {
                        loading = false;
                      });
                    }).onError((error, stackTrace){
                      setState(() {
                        loading = false;
                      });
                      Utils().toastMessage(error.toString());
                    });
                  }
              },
              child:    loading?CircularProgress(): Text('Sign Up',
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
                          text: ' Login',
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () =>
                            {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              )
                            },
                          style: TextStyle(
                            color: Colors.purple,fontWeight: FontWeight.bold,
                            fontSize: 21,)
                      )
                      ]),
                )
            ],),
          ),
        ),
      ),
    );
  }
}
