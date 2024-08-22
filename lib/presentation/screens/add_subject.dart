import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanegement/presentation/provider/subject_provider.dart';

import '../../core/error_handler.dart';
import "package:http/http.dart" as http;

class AddSubject extends StatelessWidget {
  final int? id;
  const AddSubject({super.key, required this.id});

@override
  Widget build(BuildContext context) {
    return  Scaffold(body: Consumer<SubjectProvider>(
      builder: (context, state, _) {
        
 if (state.homeFailure != null &&
              state.homeFailure is NetworkFailure) {
            return const Center(child: Text("No Internet"));
          }
     
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state.subjects != null && state.subjects!.subjects.isNotEmpty) {
           return
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              SizedBox(height: MediaQuery.of(context).size.height,
                child: ListView.builder(
            
                  itemCount: state.subjects?.subjects.length,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: ()async {
fetch(id,state.subjects!.subjects[index].id);
                        },
                        child: Container
                        (color: Colors.green,height: 100,
                        margin: EdgeInsets.only(bottom: 6),
                          
                          child: Center(child: Row(
                            children: [
                              Text(state.subjects?.subjects[index].name??"0"),
                                Text("${state.subjects?.subjects[index].id}"),
                            ],
                          ))),
                      ),
                    );
                  
                },),
              )
            
          
            ],
          ),
        );
          }
        

        return
         Center(child: Text(state.subjects?.subjects[0].name??"0"),);
      }
    ),);
  }
  fetch(int? id, int subjectid)async{
    print("sudentid:${id}=====");
        print("subject:${subjectid}=====");
        try {
 final Map<String, dynamic> body = {
    'subject': subjectid.toString(),
  };
      final response = await http.patch(Uri.parse('https://nibrahim.pythonanywhere.com/classrooms/${id}?api_key=42efb'),body: body);
 print(response.body);
 print(response.statusCode);
    } catch (e) {
    print(e);
    }
  }
}