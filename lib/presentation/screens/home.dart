import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanegement/data/models/classroom_model.dart';
import 'package:studentmanegement/di/get_it.dart';
import 'package:studentmanegement/presentation/provider/classroom_provider.dart';
import 'package:studentmanegement/presentation/provider/student_provider.dart';
import 'package:studentmanegement/presentation/screens/registration.dart';
import 'package:studentmanegement/presentation/screens/students.dart';
import 'package:studentmanegement/presentation/screens/subjects.dart';

import '../provider/subject_provider.dart';
import 'classrooms.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "GoodMorning",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.handyman))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2, // This will allow 2 items per row
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                    create: (context) => getIt<StudentProvider>()..getStudent(),
                                    child: const Students(),
                                  )),
                        );
                      },
                      child: Container(
                          color: Colors.green[50],
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person),
                              Text('Sudent'),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                    create: (context) => getIt< SubjectProvider>()..getSubject(),
                                    child: Subjects(),
                                
                                  )),
                        );
                       
                      },
                      child: Container(
                          color: Colors.blue[50],
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person),
                              Text('Subject'),
                            ],
                          )),
                    ),
                    GestureDetector(

onTap: () {
      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                    create: (context) => getIt< ClassroomProvider>()..getClassroom(),
                                    child: Classrooms(),
                                
                                  )),
                        );
},                      child: Container(
                          color: Colors.green,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person),
                              Text('Classroom'),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationsScreen()),
                        );
                      },
                      child: Container(
                          color: Colors.yellow,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person),
                              Text('Registration'),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
