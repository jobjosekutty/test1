import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanegement/presentation/screens/student_details.dart';

import '../../core/app_constants.dart';
import '../../core/error_handler.dart';
import '../provider/student_provider.dart';
import '../widgets/snack_bar.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}



class _StudentsState extends State<Students> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((time){
     //  Provider.of<StudentProvider>(context, listen: false).getStudent();

    });
      
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Consumer<StudentProvider>(
      builder: (context, state, _) {
        
 if (state.homeFailure != null &&
              state.homeFailure is NetworkFailure) {
            return const Center(child: Text("No Internet"));
          }

          if(state.homeFailure is ServerFailure){
            
                     scaffoldMessengerKey.currentState?.showSnackBar(
                appSnackBar(
                  "Server Failure",
                  Colors.red,
                ),
              );

          }
     
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state.students != null && state.students!.students.isNotEmpty) {
           return
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              SizedBox(height: MediaQuery.of(context).size.height,
                child: ListView.builder(
            
                  itemCount: state.students?.students.length,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  StudentDetails(name:state.students?.students[index].name,age:state.students?.students[index].age.toString(),email:state.students?.students[index].email)),
                        );
                          
                        },
                        child: Container
                        (color: Colors.green,height: 100,
                        margin: EdgeInsets.only(bottom: 6),
                          
                          child: Center(child: Text(state.students?.students[index].name??"0"))),
                      ),
                    );
                  
                },),
              )
            
          
            ],
          ),
        );
          }
        

        return
         Center(child: Text(state.students?.students[0].name??"0"),);
      }
    ),);
  }
}