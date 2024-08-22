import 'package:flutter/material.dart';

class StudentDetails extends StatelessWidget {
  final String? name;
    final String? age;
      final String? email;
  const StudentDetails({super.key, required this.name, this.age, this.email});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name.toString()),
              Text(age.toString()),
                  Text(email.toString())
        ],
      ),
    ),);
  }
}