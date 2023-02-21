import 'dart:convert';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:trello_front_end/components/button.dart';

import '../components/text_fields.dart';
import '../models/user.dart';

class RegisterPage extends StatelessWidget {

  RegisterPage({super.key});

  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final department = TextEditingController();
  final role = TextEditingController();
  final password = TextEditingController();

  Future<bool> signUpMethod() async {

    Map<String, dynamic> jsonMap = {
      'email' : email.text,
      'first_name' : firstName.text,
      'last_name' : lastName.text,
      'department' : department.text,
      'role' : role.text,
      'task' : 0,
      'password' : password.text
    };

    String url = "https://2ffa-2a02-2f07-db0b-f500-2dcf-aabc-9639-74b8.eu.ngrok.io/homepage/signUp";
    final Client client = Client();
    final Response response = await client.post(Uri.parse(url),
        body: json.encode(jsonMap),
        headers:  {"Accept": "application/json",
        "content-type": "application/json"});

    return response.statusCode == 200;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),

              TextFields(
                controller: email,
                hintText: "Email",
                obscureText: false,
                width: 325,
                height: 100,
              ),

              SizedBox(height: 25),

              TextFields(
                controller: password,
                hintText: "Password",
                obscureText: true,
                  width: 325,
                height: 100,
              ),

              SizedBox(height: 25),

              TextFields(
                controller: firstName,
                hintText: "First name",
                obscureText: false,
                  width: 325,
                height: 100,
              ),

              SizedBox(height: 25),

              TextFields(
                controller: lastName,
                hintText: "Last name",
                obscureText: false,
                  width: 325,
                height: 100,
              ),

              SizedBox(height: 25),

              TextFields(
                controller: department,
                hintText: "Department",
                obscureText: false,
                  width: 325,
                height: 100,
              ),

              SizedBox(height: 25),

              TextFields(
                controller: role,
                hintText: "Role",
                obscureText: false,
                  width: 325,
                height: 100,
              ),

              SizedBox(height: 25),

              Button(
                onTap: () async {
                  bool isDataOk = await signUpMethod();
                  if (isDataOk) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Account created")));
                    Navigator.pushNamed(context, "LoginPage");
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("The account could not be created because of wrong data input")));
                  }
                },
                message: 'Sign up',
                width: 300,
              ),

              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: const [
                      Text('Map for departments:'),
                      Text('0 - IT'),
                      Text('1 - HR'),
                      Text('2 - PR'),
                      Text('3 - Sales'),
                      Text('4 - Design'),
                    ],
                  ),

                  Column(
                    children: const [
                      Text('Map for roles:'),
                      Text('0 - Manager'),
                      Text('1 - Backend Developer'),
                      Text('2 - Frontend Developer'),
                      Text('3 - CEO'),
                      Text('4 - Salesperson'),
                      Text('5 - Designer'),
                      Text('6 - Accountant'),
                    ],
                  ),


                    ],
                  ),
              SizedBox(height: 25),
                ],
              )
          ),
        )
      );
  }
}
