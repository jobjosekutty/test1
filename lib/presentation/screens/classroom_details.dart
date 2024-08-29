import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_color.dart';
import '../../core/app_constants.dart';
import '../../di/get_it.dart';
import '../provider/subject_provider.dart';
import '../widgets/common_app_bar.dart';
import 'add_subject.dart';

class ClassroomDetails extends StatelessWidget {
  final String? name;
  final String? layout;
  final int? size;
  final int? studentId;
  final int? subject;
   ClassroomDetails({super.key, this.name, this.layout, this.size, this.studentId, this.subject});
String? sub;
String? teacher;
  @override
  Widget build(BuildContext context) {
    if(subject ==1){

      sub = "History";
      teacher = "Brenda Miller";

    }else if(subject ==2){
       sub = "Mathematics";
       
      teacher = "Brenda Miller";

    }else if(subject ==3){
       sub = "Social Science";
       
      teacher = " Jamie Holden";

    }else if(subject ==4){
       sub = "Physics";
         teacher = "Adam Ingram";

    }else if(subject ==5){
       sub = "Chemistry";
         teacher = "Erin Walsh";

    }else if(subject ==6){
       sub = "Biology";
  teacher = "Pamela";
    }
     int seatsFirstColumn =
                ((size ?? 0) / 2).ceil();
            log('seatsFirstColumn: $seatsFirstColumn'); // seatsFirstColumn: 9
            int seatsSecondColumn =
                (size ?? 0) - seatsFirstColumn;
    print("sizeee${size}");
    return Scaffold(
      body:  CustomScrollView(
              slivers: [
                   SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child:  Column(
                  children: [
                    SizedBox(height: 40,),
                               
              Text(name.toString()),
              
                  ],
                ),
              ),
            ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child:    Container(
               //  height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
               subject ==null?       const Text("Add Subject"):Column(children: [
                  Text(sub.toString()),
                    Text(teacher.toString())

               ],),
                 subject ==null?         CupertinoButton(
                        child: Text("add"),
                        onPressed: () {
                                  Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                    create: (context) => getIt< SubjectProvider>()..getSubject(),
                                    child: AddSubject(id:studentId),
                                
                                  )),
                        );

                        },
                        color: Colors.green,
                      ):CupertinoButton(child: Center(child: Text("Change",style: TextStyle(color: AppColors.green),)),onPressed: () {
                               Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                    create: (context) => getIt< SubjectProvider>()..getSubject(),
                                    child: AddSubject(id:studentId),
                                
                                  )),
                        );
                        
                      },)
                    ],
                  ),
                ),
              ),
                  ),
                ),
                if (layout == "classroom")
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/sitting-on-a-chair 8.png',
                                ),
                              ),
                              border: Border.all(
                                color: AppColors.tileColor,
                                width: 1,
                              ),
                            ),
                          );
                        },
                        childCount: (size ?? 0),
                      ),
                    ),
                  ),
                if (layout == "conference")
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverToBoxAdapter(
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            generateSeats(totalSeats: seatsFirstColumn),
                            Container(
                              width: 100,
                              color: AppColors.tileColor,
                            ),
                            generateSeats(
                              totalSeats: seatsSecondColumn,
                              isSecondColumn: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                                    SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverToBoxAdapter(
                      child: IntrinsicHeight(
                        child: 
                                   subject!= null ? Container(height: 50,width: double.infinity,color: Colors.grey,child: Center(child: Text("subject updated",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 18),)),):Container(),
                      ),
                    ),
                  ),
              ],
            ),
    );
    
    // Scaffold(
    //   body: Container(
    //     height: double.infinity,
    //     width: double.infinity,
    //     child: Padding(
    //       padding: const EdgeInsets.all(12.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           SizedBox(height: 45,),
    //           Text("ClassRoom"),
    //           Text(name.toString()),
    //            Text(layout.toString()),
    //           Container(
    //             height: 100,
    //             width: double.infinity,
    //             decoration: BoxDecoration(
    //               color: Colors.grey,
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //            subject ==null?       Text("Add Subject"):Column(children: [
    //               Text(sub.toString()),
    //                 Text(teacher.toString())

    //            ],),
    //              subject ==null?         CupertinoButton(
    //                     child: Text("add"),
    //                     onPressed: () {
    //                               Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                           builder: (context) => ChangeNotifierProvider(
    //                                 create: (context) => getIt< SubjectProvider>()..getSubject(),
    //                                 child: AddSubject(id:studentId),
                                
    //                               )),
    //                     );

    //                     },
    //                     color: Colors.green,
    //                   ):Container(height: 100,width: 50,child: Center(child: Text("Change")),)
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             child: GridView.builder(
    //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 4,
    //                 childAspectRatio: 1, 
    //               ),
    //               itemCount: size,
    //               itemBuilder: (context, index) {
    //                 return const Card(
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Icon(Icons.person, size: 40),
    //                       SizedBox(height: 8),
    //                     ],
    //                   ),
    //                 );
    //               },
    //             ),
    //           ),

    //             subject!= null ? Container(height: 100,width: double.infinity,color: Colors.red,child: Center(child: Text("subject updated")),):Container(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
   Column generateSeats({required int totalSeats, bool isSecondColumn = false}) {
    return Column(
      children: List.generate(
        totalSeats,
        (index) => Transform.flip(
          flipX: isSecondColumn,
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/sitting-on-a-chair 8.png',
                ),
              ),
            ),
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
