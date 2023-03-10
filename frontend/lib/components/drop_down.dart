import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {

  final List<dynamic> list;

  DropdownButtonExample({super.key,
    required this.list});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();

}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {

  String? dropdownValue;

  @override
  void initState(){
    super.initState();
    dropdownValue = widget.list.first;
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
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
          dropdownValue = value!;
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
