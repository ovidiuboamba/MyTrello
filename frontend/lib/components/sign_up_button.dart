import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {

  final Function() onTap;

  const SignUp({
    super.key,
  required this.onTap});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
              child: Text(
                ' Sign up here!',
                style: TextStyle(color: Colors.blueGrey),
              )
          )
      ),
    );
  }
}
