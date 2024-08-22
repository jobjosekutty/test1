import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanegement/presentation/provider/classroom_provider.dart';
import 'package:studentmanegement/presentation/screens/classroom_details.dart';

import '../../core/error_handler.dart';

class Classrooms extends StatelessWidget {
  const Classrooms({super.key});

@override
  Widget build(BuildContext context) {
    return  Scaffold(body: Consumer<ClassroomProvider>(
      builder: (context, state, _) {
        
 if (state.homeFailure != null &&
              state.homeFailure is NetworkFailure) {
            return const Center(child: Text("No Internet"));
          }
     
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state.classroom != null && state.classroom!.classrooms.isNotEmpty) {
           return
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              SizedBox(height: MediaQuery.of(context).size.height,
                child: ListView.builder(
            
                  itemCount: state.classroom?.classrooms.length,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  ClassroomDetails(name:state.classroom?.classrooms[index].name,layout:state.classroom?.classrooms[index].layout.toString(),size:state.classroom?.classrooms[index].size.toString())),
                        );
                          
                        },
                        child: Container
                        (color: Colors.green,height: 100,
                        margin: EdgeInsets.only(bottom: 6),
                          
                          child: Center(child: Text(state.classroom?.classrooms[index].name??"0"))),
                      ),
                    );
                  
                },),
              )
            
          
            ],
          ),
        );
          }
        

        return
         Center(child: Text(state.classroom?.classrooms[0].name??"0"),);
      }
    ),);
  }
}