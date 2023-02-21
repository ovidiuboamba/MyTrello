import 'dart:convert';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:trello_front_end/components/button.dart';
import 'package:trello_front_end/components/text_fields.dart';

import '../components/sign_up_button.dart';
import '../models/user.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  User user = User();

  Future<bool> signIn() async{

    String inputEmail = emailController.text;
    String url = "https://2ffa-2a02-2f07-db0b-f500-2dcf-aabc-9639-74b8.eu.ngrok.io/homepage/login/$inputEmail"; //url to be changed with ngrok
    final Client _client = Client();
    final Response response = await _client.get(Uri.parse(url));
    if(response.statusCode != 200) return false;
    User currentUser = User.fromJson(jsonDecode(response.body));
    if(currentUser.password == passwordController.text){

      user.email = currentUser.email;
      user.password = currentUser.password;
      user.firstName = currentUser.firstName;
      user.lastName = currentUser.lastName;
      user.department = currentUser.department;
      user.role = currentUser.role;
      return true;
    }
    return false;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.grey,
        body: SafeArea(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 125),
                    const Icon(
                        Icons.accessibility_new,
                        size: 100
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Welcome!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                      )

                    ),

                    const SizedBox(height: 25),

                    TextFields(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                      width: 325,
                      height: 100,
                    ),

                    const SizedBox(height: 25),

                    TextFields(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      width: 325,
                      height: 100,
                    ),

                    const SizedBox(height: 25),

                    Button(
                      onTap: () async {
                        bool isUserOk = await signIn();
                        if(isUserOk) {
                          Navigator.pushNamed(context, "Home", arguments: user);
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Invalid credentials"))
                          );
                        }
                        },
                      message: 'Sign in',
                      width: 300,
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t you have an account?',
                          style: TextStyle(color: Colors.black),
                        ),
                        SignUp(
                          onTap: (){ Navigator.pushNamed(context, "RegisterPage");},
                        )
                      ],
                    )

                  ]
        ),
            )

      )
    );
  }
}
