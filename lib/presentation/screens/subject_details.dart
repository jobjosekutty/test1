import 'package:flutter/material.dart';

class SubjectDetails extends StatelessWidget {
  final String? name;
  final String? teacher;
  final String? credit;
  const SubjectDetails({super.key, required this.name, required this.teacher, required this.credit});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name.toString()),
              Text(teacher.toString()),
                  Text(credit.toString())
        ],
      ),
    ),);
  }
}