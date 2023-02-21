import 'package:flutter/material.dart';

import 'drop_down.dart';

class ManagerOnly extends StatelessWidget {
  const ManagerOnly({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('Select the department to see all employees: '),
          //DropdownButtonExample()
        ]
      ),

    );
  }
}
