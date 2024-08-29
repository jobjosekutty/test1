import 'package:flutter/material.dart';

class StudentDetails extends StatelessWidget {
  final String? name;
    final String? age;
      final String? email;
  const StudentDetails({super.key, required this.name, this.age, this.email});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Student Details"),centerTitle: true,),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name.toString(),style: TextStyle(fontWeight:FontWeight.bold)),
              Text(age.toString(),style: TextStyle(fontWeight:FontWeight.bold)),
                  Text(email.toString(),style: TextStyle(fontWeight:FontWeight.bold))
        ],
      ),
    ),);
  }
}