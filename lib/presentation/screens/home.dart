import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanegement/core/app_constants.dart';
import 'package:studentmanegement/data/models/classroom_model.dart';
import 'package:studentmanegement/di/get_it.dart';
import 'package:studentmanegement/presentation/provider/classroom_provider.dart';
import 'package:studentmanegement/presentation/provider/registration_provider.dart';
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
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
                          decoration: BoxDecoration(
                           color: gridColors[0],
                        borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.school),
                              Text('Student'),
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
                         decoration: BoxDecoration(
                           color: gridColors[1],
                        borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.import_contacts_outlined),
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
                          decoration: BoxDecoration(
                           color: gridColors[2],
                        borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.meeting_room),
                              Text('Classroom'),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        //   Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => RegistrationsScreen()),
                        // );
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                    create: (context) => getIt<RegistrationProvider>()..getRegistartion(),
                                    child: const RegistrationsScreen(),
                                  )),
                        );
                      },
                      child: Container(
                       decoration: BoxDecoration(
                           color: gridColors[3],
                        borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit),
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
