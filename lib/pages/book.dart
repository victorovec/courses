import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.pink[50],
       body: Center(
        child: Text("COURSE SCREEN"),
       ),
    );
  }
}