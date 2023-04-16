import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,this.buttonTitle
  });
  final String? buttonTitle;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      child: Text(buttonTitle??'Login',
          style: TextStyle(
          fontSize: 20,
          color: Colors.white)
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.purple)
      ),
    );
  }
}
