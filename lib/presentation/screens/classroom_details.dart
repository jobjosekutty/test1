import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../di/get_it.dart';
import '../provider/subject_provider.dart';
import 'add_subject.dart';

class ClassroomDetails extends StatelessWidget {
  final String? name;
  final String? layout;
  final int? size;
  final int? studentId;
  const ClassroomDetails({super.key, this.name, this.layout, this.size, this.studentId});

  @override
  Widget build(BuildContext context) {
    print("sizeee${size}");
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 45,),
              Text("ClassRoom"),
              Text(name.toString()),
              Container(
                height: 100,
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
                      Text("Add Subject"),
                      CupertinoButton(
                        child: Text("add"),
                        onPressed: () {
                            //      Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>  AddSubject()),
                            // );
                                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                    create: (context) => getIt< SubjectProvider>()..getSubject(),
                                    child: AddSubject(id:studentId),
                                
                                  )),
                        );

                        },
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Number of columns
                    childAspectRatio: 1, // Adjust this value for smaller cards
                  ),
                  itemCount: size,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person, size: 40), // Small icon for each student
                          SizedBox(height: 8),
                          // Text(
                          //   students[index],
                          //   style: TextStyle(fontSize: 14),
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
