import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {

  final List<dynamic>? list;

  const MyListView({super.key,
  required this.list});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: list!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(list![index].firstName, textAlign: TextAlign.center),
                    ),
                    Container(
                      width: 100,
                        height: 50,
                        alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(list![index].lastName, textAlign: TextAlign.center)
                    ),
                    Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(list![index].role, textAlign: TextAlign.center)
                    ),
                  ],
                ),
              );
            },
        ),
      ),
    );
  }
}
