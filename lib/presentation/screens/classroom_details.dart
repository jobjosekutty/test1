import 'package:flutter/material.dart';

class ClassroomDetails extends StatelessWidget {
  final String? name;
  final String? layout;
  final String? size;
  const ClassroomDetails({super.key, this.name, this.layout, this.size});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name.toString()),
              Text(layout.toString()),
                  Text(size.toString())
        ],
      ),
    ),);
  }
}