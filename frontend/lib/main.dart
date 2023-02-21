import 'package:flutter/material.dart';
import 'package:trello_front_end/pages/employees_page.dart';
import 'package:trello_front_end/pages/home_page.dart';
import 'package:trello_front_end/pages/new_task_page.dart';
import 'package:trello_front_end/pages/projects_page.dart';
import 'package:trello_front_end/pages/register_page.dart';
import 'package:trello_front_end/pages/tasks_page.dart';
import '/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        "LoginPage" : (BuildContext context) => LoginPage(),
        "Home" : (BuildContext context) => const HomePage(),
        "RegisterPage" : (BuildContext context) => RegisterPage(),
        "EmployeesPage" : (BuildContext context) => const EmployeesPage(),
        "ProjectsPage" : (BuildContext context) => const ProjectsPage(),
        "NewTaskPage" : (BuildContext context) =>  NewTaskPage(),
        "TasksPage": (BuildContext context) => const TasksPage(),
      },
    );
  }
}



