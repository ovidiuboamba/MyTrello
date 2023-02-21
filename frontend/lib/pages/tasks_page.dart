import 'package:flutter/material.dart';
import 'package:trello_front_end/components/list_view_projects.dart';
import 'package:trello_front_end/components/show_tasks.dart';

import '../components/list_view.dart';
import '../components/list_view_tasks.dart';
import '../models/task.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = ModalRoute.of(context)!.settings.arguments as List<dynamic>?;
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
                  const Text('The list of the active tasks: ', style: TextStyle(fontSize: 22)),
                  MyListViewTasks(list: list),
                ],
              )
          ),
        )
    );
  }
}
