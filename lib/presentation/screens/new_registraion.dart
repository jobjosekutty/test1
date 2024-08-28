import 'dart:developer';


import 'package:flutter/material.dart';

import '../../core/app_color.dart';
import '../../core/app_constants.dart';
import '../widgets/common_app_bar.dart';


class NewRegistrationScreen extends StatelessWidget {
  const NewRegistrationScreen({super.key});

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
                        title: Text(
                         
                              'Select a Student'
                         
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
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
                        title: Text(
                        
                              'Select a Subject'
                           
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
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
}
