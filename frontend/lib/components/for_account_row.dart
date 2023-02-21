import 'package:flutter/material.dart';

class PairTextText extends StatelessWidget {

  final String? text1;
  final String? text2;

  const PairTextText({super.key, required this.text1, required this.text2});


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        Text(text1.toString(), style: const TextStyle(fontSize: 15),),
        Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.black),
          ),
          child:Text(text2.toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 15)),
        ),
      ]
        ),
    );
  }
}
