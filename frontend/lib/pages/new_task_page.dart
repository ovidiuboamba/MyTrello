import 'dart:convert';

import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:trello_front_end/components/button.dart';

import '../components/text_fields.dart';
import '../models/task.dart';
import '../models/user.dart';

class NewTaskPage extends StatelessWidget {

  NewTaskPage({super.key});

  final taskController = TextEditingController();
  final descriptionController = TextEditingController();
  final deadlineController = TextEditingController();


  Future<int> createTask(String email) async{

    String urlLast = "https://2ffa-2a02-2f07-db0b-f500-2dcf-aabc-9639-74b8.eu.ngrok.io/homepage/getLastTask";
    final clientLast = Client();

    final Response responseLast = await clientLast.get(Uri.parse(urlLast));
    dynamic jsonGet = jsonDecode(responseLast.body);
    int lastIndex = jsonGet['idTask'];
    Map<String, dynamic> json = {
      "idTask": lastIndex,
      "name_task": taskController.text,
      "description": descriptionController.text,
      "deadline": deadlineController.text,
      "email": email
    };

    String url = "https://2ffa-2a02-2f07-db0b-f500-2dcf-aabc-9639-74b8.eu.ngrok.io/homepage/createTask";
    final client = Client();
    final Response response = await client.post(
      Uri.parse(url),
      body: jsonEncode(json),
        headers:  {"Accept": "application/json",
      "content-type": "application/json"}
    );
    if(response.statusCode == 200){
      return lastIndex;
    }
    else{
      return -1;
    }

  }

  Future<Task> updateTask(int lastIndex, String email) async{

    // find by email the user and then update its task with lastIndex
    String urlGetClient = "https://2ffa-2a02-2f07-db0b-f500-2dcf-aabc-9639-74b8.eu.ngrok.io/homepage/lastLastTask"; //url to be changed with ngrok
    final Client client1 = Client();
    final Response response1 = await client1.get(Uri.parse(urlGetClient));
    Task currentTask = Task.fromJson(jsonDecode(response1.body));

    Map<String, dynamic> json = {
      'name_task' : currentTask.name,
      'description' : currentTask.description,
      'deadline' : currentTask.deadline,
      'department' : email,
    };

    String urlCreateTask = "https://2ffa-2a02-2f07-db0b-f500-2dcf-aabc-9639-74b8.eu.ngrok.io/homepage/updateUserTask";
    final client = Client();
    final Response response = await client.put(
        Uri.parse(urlCreateTask),
        body: jsonEncode(json),
        headers:  {"Accept": "application/json",
          "content-type": "application/json"}
    );
    return currentTask;
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text('Trello'),
      ),
      backgroundColor: Colors.grey[400],
      body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Name of the task: '),
                    const SizedBox(height: 10),
                    TextFields(
                      controller: taskController,
                      obscureText: false,
                      hintText: 'Max 50 characters',
                      height: 100,
                      width: 300,
                    ),
                    const SizedBox(height: 25),
                    const Text('Description: '),
                    const SizedBox(height: 10),
                    TextFields(
                      controller: descriptionController,
                      obscureText: false,
                      hintText: 'Max 200 characters',
                      height: 100,
                      width: 300,
                    ),
                    const SizedBox(height: 25),
                    const Text('Deadline: '),
                    const SizedBox(height: 10),
                    TextFields(
                      controller: deadlineController,
                      obscureText: false,
                      hintText: '',
                      height: 100,
                      width: 300,
                    ),
                    const SizedBox(height: 25),
                    Button(onTap: () async{
                      int lastIndex = await createTask(email);

                      if(lastIndex != -1){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("The task has been added to the user")));
                      }

                      /*if(lastIndex != -1){
                        Task currentTask = await updateTask(lastIndex, email);
                        if(currentTask != null){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("The task has been added to the user"))
                          );
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("The task is created, but cannot be assigned to the user"))
                          );
                        }
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("The task could not be created"))
                        );
                      }*/
                    },
                        message: 'Add task',
                        width: 100)
                  ],
                ),
            ),
          )
      ),
    );
  }
}
