import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanegement/presentation/provider/subject_provider.dart';

import '../../core/error_handler.dart';
import 'subject_details.dart';

class Subjects extends StatelessWidget {
  const Subjects({super.key});

 @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: Text("Students"),centerTitle: true,),
      body: Consumer<SubjectProvider>(
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
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  SubjectDetails(name:state.subjects?.subjects[index].name,teacher:state.subjects?.subjects[index].teacher.toString(),credit:state.subjects?.subjects[index].credits.toString())),
                        );
                          
                        },
                        child: Container
                        
                        (height: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey,),
                        
                        margin: EdgeInsets.only(bottom: 6),
                        padding: EdgeInsets.all(10),
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.subjects?.subjects[index].name??"",style: TextStyle(fontWeight:FontWeight.bold)),
                                    Text(state.subjects?.subjects[index].teacher??"",style: TextStyle(fontWeight:FontWeight.bold)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.subjects?.subjects[index].credits.toString()??"",style: TextStyle(fontWeight:FontWeight.bold)),
                                  Text("Credit",style: TextStyle(fontWeight:FontWeight.bold))

                                ],
                              )
                            ],
                          )),
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
}