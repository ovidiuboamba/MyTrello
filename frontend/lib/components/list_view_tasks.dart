import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'button.dart';

class MyListViewTasks extends StatelessWidget {

  final List<dynamic>? list;

  const MyListViewTasks({super.key,
    required this.list});

  Future<bool> deleteTask(dynamic element) async{

    String url = "https://2ffa-2a02-2f07-db0b-f500-2dcf-aabc-9639-74b8.eu.ngrok.io/homepage/deleteTask/${element.id}";
    final client = Client();
    final Response response = await client.delete(Uri.parse(url));
    return response.statusCode == 200;
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          //padding: const EdgeInsets.all(8),
          itemCount: list!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(list![index].name, textAlign: TextAlign.center),
                  ),
                  Container(
                      width: 80,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(list![index].description, textAlign: TextAlign.center)
                  ),
                  Container(
                      width: 80,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(list![index].deadline, textAlign: TextAlign.center)
                  ),
                  Container(
                    width: 70,
                    height: 50,
                    child: Button(
                    onTap: () async{
                      bool isTask = await deleteTask(list![index]);
                      if(isTask == true){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("You have finished a task. Exit and enter the page to see the rest og your tasks")));
                      }
                    },
                    message: 'Finish',
                    width: 50,
                    ),
                  )

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
