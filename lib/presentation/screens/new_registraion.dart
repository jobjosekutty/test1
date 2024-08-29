import 'dart:convert';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentmanegement/di/get_it.dart';
import 'package:studentmanegement/presentation/provider/student_provider.dart';
import 'package:studentmanegement/presentation/screens/student_selection.dart';
import 'package:studentmanegement/presentation/screens/subject_selection.dart';

import '../../core/app_color.dart';
import '../../core/app_constants.dart';
import '../provider/subject_provider.dart';
import '../widgets/common_app_bar.dart';
import "package:http/http.dart" as http;


class NewRegistrationScreen extends StatefulWidget {
   NewRegistrationScreen({super.key, this.subject, this.student, this.subjectid, this.studentid});

  final String? subject;
  final String? student;
  final int? studentid;
  final int? subjectid;

  @override
  State<NewRegistrationScreen> createState() => _NewRegistrationScreenState();
}

class _NewRegistrationScreenState extends State<NewRegistrationScreen> {
  @override
  void initState() {
    print(widget.studentid);
    data();
    get();
  
    super.initState();
  }
  String? stu;
  String? sub;
  int? stuid;
  int? subid;
  data()async{
     final SharedPreferences preferences = await SharedPreferences.getInstance();
           preferences.setString("student",widget.student!);
            preferences.setString("subject",widget.subject!);
             





  }
  get()async{
      final SharedPreferences preferences = await SharedPreferences.getInstance();
    
            stu = preferences.getString("student");
            print("====getstudent==$stu");
            
    sub=        preferences.getString("subject");
     print("====getsubject==$sub");
      stuid=        preferences.getInt("studentid");
        print("====getsubject==$stuid");
       subid=        preferences.getInt("subjectid");
         print("====getsubject==$subid");
     setState(() {
       
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CommonAppbar(title: 'New Registration'),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
              ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        tileColor: AppColors.tileColor,
                        title:widget.student!=null?Text(widget.student.toString()):stu!=null?Text(stu.toString()): Text(
                         
                              'Select a Student'
                         
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                    create: (context) => getIt<StudentProvider>()..getStudent(),
                                    child: StudentSelection(),
                                  )),
                        );
                          // context
                          //     .pushNamed('students', extra: true)
                          //     .then((value) {
                          //   if (value != null) {
                          //     final data = value as Map<String, dynamic>;
                          //     final studentId = data['id'] as String;
                          //     log('Student Id: $studentId');
                          //     final studentName = data['name'] as String;
                          //     log('Student Name: $studentName');
                          //     context.read<NewRegistrationBloc>().add(
                          //           SelectRegistration(
                          //             studentId: studentId,
                          //             studentName: studentName,
                          //           ),
                          //         );
                          //   }
                          // });
                        },
                      ),
                  setHeight(16),
             ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        tileColor: AppColors.tileColor,
                        title:widget.subject!=null?Text(widget.subject.toString()):sub!=null?Text(sub.toString()): Text(
                        
                              'Select a Subject'
                           
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                    create: (context) => getIt< SubjectProvider>()..getSubject(),
                                    child: SubjectSelection(),
                                
                                  )),
                        );
                          //SubjectSelection
                          // context.pushNamed(
                          //   'subjects',
                          //   queryParameters: {
                          //     "route": "registration",
                          //   },
                          // ).then((value) {
                          //   if (value != null) {
                          //     final data = value as Map<String, dynamic>;
                          //     final subjectId = data['id'] as String;
                          //     log('Subject Id: $subjectId');
                          //     final subjectName = data['name'] as String;
                          //     log('Subject Name: $subjectName');
                          //     context.read<NewRegistrationBloc>().add(
                          //           SelectRegistration(
                          //             subjectId: subjectId,
                          //             subjectName: subjectName,
                          //           ),
                          //         );
                          //   }
                          // });
                        },
                      ),
                  setHeight(32),
               ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          createRegistration(stuid,subid);
                          // if (state.selectedStudentId.isNotEmpty &&
                          //     state.selectedSubjectId.isNotEmpty) {
                          //   context.read<NewRegistrationBloc>().add(
                          //         RegisterStudent(
                          //           studentId: state.selectedStudentId,
                          //           subjectId: state.selectedSubjectId,
                          //         ),
                          //       );
                          // } else {
                          //   ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                          //     SnackBar(
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(8),
                          //       ),
                          //       behavior: SnackBarBehavior.floating,
                          //       padding: const EdgeInsets.all(16),
                          //       backgroundColor: Colors.red,
                          //       content: const Text(
                          //         'Please select a student and a subject.',
                          //       ),
                          //     ),
                          //   );
                          // }
                        },
                        child: const Text('Register'),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> createRegistration(int? studentId, int? subjectId) async {
    print(stuid);
    print(subid);
  final String url = 'https://nibrahim.pythonanywhere.com/registration/?api_key=42efb';

  final response = await http.post(
    Uri.parse(url),
    body: {
      'student': studentId.toString(),
      'subject': subjectId.toString(),
    },
  );
log(response.body);
  if (response.statusCode == 200) {
    // Successfully received a response from the server
    final responseBody = jsonDecode(response.body);
    print('Response ID: ${responseBody['id']}');
    print('Student ID: ${responseBody['student']}');
    print('Subject ID: ${responseBody['subject']}');
  } else {
    // Handle the error
    print('Failed to create registration. Status code: ${response.statusCode}');
  }
}
}
