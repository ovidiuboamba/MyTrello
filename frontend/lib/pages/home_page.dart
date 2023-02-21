import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trello_front_end/components/button.dart';
import 'package:trello_front_end/components/drop_down.dart';
import 'package:trello_front_end/components/for_account_row.dart';
import 'package:http/http.dart';
import 'package:trello_front_end/models/department.dart';
import 'package:trello_front_end/models/empdd.dart';

import '../components/show_tasks.dart';
import '../components/text_fields.dart';
import '../models/employee.dart';
import '../models/project.dart';
import '../models/task.dart';
import '../models/user.dart';

String dropdownValueDeps = 'IT';
String dropdownValueUsers = 'Ovidiu Boamba';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  User userGlobal = User();
  List<dynamic> deps = [];
  List<dynamic> empDD = [];
  List<dynamic> projects = [];
  List<dynamic> users = [];
  List<dynamic> tasks = [];
  final emailController = TextEditingController();
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      if(index != 1 || userGlobal.role == 'Manager'){
        _selectedIndex = index;
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("You do not have access to this menu")));
      }
    }
    );
  }

  Future<bool> getDepartments() async {
    String url = "https://2ffa-2a02-2f07-db0b-f500-2dcf-aabc-9639-74b8.eu.ngrok.io/homepage/departments"; //url to be changed with ngrok
    final Client _client = Client();
    final Response response = await _client.get(Uri.parse(url));
    if(response.statusCode == 200){
      List<dynamic> departments = jsonDecode(response.body);
      deps = departments;
      int i;
      String element;
      for(i = 0; i < deps.length; i++){
        element = deps.elementAt(0)['name_dep'];
        deps.add(element);
        deps.removeAt(0);
      }

      return true;
    }
    return false;
  }

  Future<bool> showAllEmployees() async{
    String url = "https://2ffa-2a02-2f07-db0b-f500-2dcf-aabc-9639-74b8.eu.ngrok.io/homepage/employees/$dropdownValueDeps"; //url to be changed with ngrok
    final Client _client = Client();
    final Response response = await _client.get(Uri.parse(url));
    if(response.statusCode == 200){
      empDD.clear();
      List<dynamic> emp = jsonDecode(response.body);
      int i;
      for(i = 0; i < emp.length; i++){
       String firstName = emp.elementAt(i)['first_name'];
       String lastName = emp.elementAt(i)['last_name'];
       String role = emp.elementAt(i)['role'];
        Employee currentEmp = Employee(
          firstName,
          lastName,
          role,
        );
        empDD.add(currentEmp);
      }
      return true;
    }
    return false;
  }

  Future<bool> selectUserForNewTask() async{
    String url = "https://2ffa-2a02-2f07-db0b-f500-2dcf-aabc-9639-74b8.eu.ngrok.io/homepage/users/${emailController.text}"; //url to be changed with ngrok
    final Client _client = Client();
    final Response response = await _client.get(Uri.parse(url));
    return response.statusCode == 200;
  }

  Future<bool> getAllTasksByEmail(String email) async{
    String url = "https://2ffa-2a02-2f07-db0b-f500-2dcf-aabc-9639-74b8.eu.ngrok.io/homepage/getTasksByEmail/$email";
    final Client client = Client();
    final Response response = await client.get(Uri.parse(url));
    if(response.statusCode == 200){
      tasks.clear();
      List<dynamic> t = jsonDecode(response.body);
      int i;
      for(i = 0; i < t.length; i++){
        String nameTask = t.elementAt(i)['name_task'];
        String description = t.elementAt(i)['description'];
        String deadline = t.elementAt(i)['deadline'];
        int idTask = t.elementAt(i)['idTask'];
        while (deadline[deadline.length-1] != 'T') {
          deadline = deadline.substring(0, deadline.length - 1);
        }
        deadline = deadline.substring(0, deadline.length - 1);
        String email = t.elementAt(i)['email'];
        Task currentTask = Task(
          idTask,
          email,
          nameTask,
          description,
          deadline,
        );
        tasks.add(currentTask);
      }
      return true;
    }
    return false;
  }

  Future<bool> showAllProjects() async{
    String url = "https://2ffa-2a02-2f07-db0b-f500-2dcf-aabc-9639-74b8.eu.ngrok.io/homepage/projects"; //url to be changed with ngrok
    final Client _client = Client();
    final Response response = await _client.get(Uri.parse(url));
    if(response.statusCode == 200){
      projects.clear();
      List<dynamic> projectsResponse = jsonDecode(response.body);
      int i;
      for(i = 0; i < projectsResponse.length; i++){
        String nameProject = projectsResponse.elementAt(i)['nameProject'];
        String company = projectsResponse.elementAt(i)['company'];
        String deadline = projectsResponse.elementAt(i)['deadline'];
        while (deadline[deadline.length-1] != 'T') {
          deadline = deadline.substring(0, deadline.length - 1);
        }
        deadline = deadline.substring(0, deadline.length - 1);
        Project currentProject = Project(
          nameProject,
          company,
          deadline,
        );
        projects.add(currentProject);
      }
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    userGlobal = user;
    var ok = getDepartments();
    for(var dep in deps){
      dep = dep.toString();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text('Trello'),
      ),
      backgroundColor: Colors.grey[400],
      body: Center(
        child:<Widget>[
      SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Show all my tasks:', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 10),
              Button(
                  onTap: () async {
                    bool isOk = await getAllTasksByEmail(user.email!);
                    if(tasks.isEmpty == true){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("You have no current tasks!")));
                    }
                    else if(isOk == true){
                      Navigator.pushNamed(context, 'TasksPage', arguments: tasks);
                    }
                  },
                  message: 'Go',
                  width: 50),

            ],
          ),

      ),
          SafeArea(
          child: Column(
            children: [

              const SizedBox(height: 25),

              Row(
                children: [
                  Text('  See all the employees for: '),
                  DropdownButtonExample(list: deps),
                ],
              ),
              Button(onTap: () async{
                bool isPressed = await showAllEmployees();
                EmployeeDD toSend = EmployeeDD(empDD, dropdownValueDeps);
                if(isPressed == true){
                  Navigator.pushNamed(context, 'EmployeesPage', arguments: toSend);
                }

              },
                  message: 'Go',
                  width: 50),

              const SizedBox(height: 25),

              Column(
                children: [
                  const Text('  Add a new task for: '),
                  const SizedBox(height: 10),
                  TextFields(
                    controller: emailController,
                    hintText: 'Expected user\'s email',
                    obscureText: false,
                    width: 325,
                    height: 100,
                  )
                ],
              ),
              const SizedBox(height: 15),
              Button(onTap: () async{
                bool isPressed = await selectUserForNewTask();
                if(isPressed == true){
                  Navigator.pushNamed(context, 'NewTaskPage', arguments: emailController.text.toString());
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("This user does not exist"))
                  );
                }

              },
                  message: 'Go',
                  width: 50),

            ],

          ),
        ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 25),

                const Text('See all the ongoing projects: ', style: TextStyle(fontSize: 25)),

                const SizedBox(height: 25),

                Button(onTap: () async{
                  bool isPressed = await showAllProjects();
                  if(isPressed == true){
                    Navigator.pushNamed(context, 'ProjectsPage', arguments: projects);
                  }

                },
                    message: 'Go',
                    width: 100),

              ],

            ),
          ),
        Column( // Account Page
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height:25),
            const Text('Account Details', style: TextStyle(fontSize: 30)),
            const SizedBox(height:75),
            PairTextText(text1: '   Email      ', text2: user.email.toString()),
            PairTextText(text1: 'First name    ', text2: user.firstName.toString()),
            PairTextText(text1: 'Last name     ', text2: user.lastName.toString()),
            PairTextText(text1: 'Department    ', text2: user.department.toString()),
            PairTextText(text1: '  Role        ', text2: user.role.toString()),
          ],

        ),
        ].elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black38,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarms_rounded),
            label: 'Tasks',
            backgroundColor: Colors.black38,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new_rounded),
            label: 'Manager Only',
            backgroundColor: Colors.black38,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_outlined),
            label: 'Projects',
            backgroundColor: Colors.black38,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
            backgroundColor: Colors.black38,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {

  final List<dynamic> list;

  const DropdownButtonExample({super.key,
    required this.list});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();

}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {

  //String? dropdownValueDeps;


  @override
  void initState(){
    super.initState();
    dropdownValueDeps = widget.list.first;
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValueDeps,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black38,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValueDeps = value!;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DropdownButtonUsers extends StatefulWidget {

  final List<dynamic> list;

  const DropdownButtonUsers({super.key,
    required this.list});

  @override
  State<DropdownButtonUsers> createState() => _DropdownButtonUsersState();

}

class _DropdownButtonUsersState extends State<DropdownButtonUsers> {

  @override
  void initState() {
    super.initState();
    dropdownValueUsers = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValueUsers,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black38,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValueUsers = value!;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
