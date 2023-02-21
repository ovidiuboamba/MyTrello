import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trello_front_end/components/button.dart';
import 'package:trello_front_end/components/drop_down.dart';
import 'package:trello_front_end/components/for_account_row.dart';
import 'package:http/http.dart';
import 'package:trello_front_end/models/department.dart';

import '../components/list_view.dart';
import '../models/empdd.dart';
import '../models/user.dart';
import 'home_page.dart';

class EmployeesPage extends StatelessWidget {

  const EmployeesPage({super.key});



  @override
  Widget build(BuildContext context) {
    final employeeDD = ModalRoute.of(context)!.settings.arguments as EmployeeDD;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: const Text('Trello'),
        ),
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        minimum: EdgeInsets.all(10),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Text('The list of the employees working in the ${employeeDD.dd} department: ', style: TextStyle(fontSize: 18)),
              MyListView(list: employeeDD.list),
            ],
          )
        ),
      )
    );
  }
}

