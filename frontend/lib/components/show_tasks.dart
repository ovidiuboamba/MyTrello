import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {

  final String message;

  const TaskContainer({
    super.key,
    required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      constraints: const BoxConstraints(
        maxWidth: 300,
        maxHeight: 100
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
    );
  }
}
