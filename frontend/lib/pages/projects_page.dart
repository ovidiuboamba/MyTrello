import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trello_front_end/components/button.dart';
import 'package:trello_front_end/components/drop_down.dart';
import 'package:trello_front_end/components/for_account_row.dart';
import 'package:http/http.dart';
import 'package:trello_front_end/components/list_view_projects.dart';
import 'package:trello_front_end/models/department.dart';

import '../components/list_view.dart';
import '../models/empdd.dart';
import '../models/project.dart';
import '../models/user.dart';
import 'home_page.dart';

class ProjectsPage extends StatelessWidget {

  const ProjectsPage({super.key});


  @override
  Widget build(BuildContext context) {
    int i;
    final List<dynamic> projects= ModalRoute.of(context)!.settings.arguments as List<dynamic>;
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
                  const Text('The list of the ongoing projects: ', style: TextStyle(fontSize: 22)),
                  MyListViewProjects(list: projects),
                ],
              )
          ),
        )
    );
  }
}

