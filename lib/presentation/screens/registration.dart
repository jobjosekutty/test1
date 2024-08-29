
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanegement/core/app_color.dart';
import 'package:studentmanegement/presentation/provider/registration_provider.dart';
import 'package:studentmanegement/presentation/screens/new_registraion.dart';
import 'package:studentmanegement/presentation/widgets/common_app_bar.dart';
import "package:http/http.dart" as http;

import '../../core/error_handler.dart';

class RegistrationsScreen extends StatefulWidget {
  const RegistrationsScreen({super.key});

  @override
  State<RegistrationsScreen> createState() => _RegistrationsScreenState();
}

class _RegistrationsScreenState extends State<RegistrationsScreen> {
  // @override
  // void initState() {
  //   data();
  //   super.initState();
  // }
  data()async{
    final String url = 'https://nibrahim.pythonanywhere.com/registration/?api_key=42efb';

  final response = await http.get(
    Uri.parse(url),
   
  );
log(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration"),centerTitle: true,),
      body: Consumer<RegistrationProvider>(
        builder: (context, state, _) {
           if (state.homeFailure != null &&
            state.homeFailure is NetworkFailure) {
          return const Center(child: Text("No Internet"));
        }
           
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
         if (state.registration == null || state.registration!.registrations.isEmpty) {
           return const Center(child: Text("No Data"));

         }
        if (state.registration != null && state.registration!.registrations.isNotEmpty) {
          return SingleChildScrollView(
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
               // SizedBox(height: 40,),
                SizedBox(height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
              
                    itemCount: state.registration?.registrations.length,
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () async{
        
                            
                          },
                          child: Container
                          (height: 100,padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                          ),
                            
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("ffffffff",style: TextStyle(fontWeight:FontWeight.bold),),
                                     Text("gggggg",style: TextStyle(fontWeight:FontWeight.bold)),
                                  ],
                                ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                           Text("Age:",style: TextStyle(fontWeight:FontWeight.bold)),
                                              
                                          Text("hhhhhhhh",style: TextStyle(fontWeight:FontWeight.bold)),
                                        ],
                                      ),
                                      IconButton(onPressed: (){
                                               Provider.of<RegistrationProvider>(context, listen: false).registrationDelete(state.registration!.registrations[index].id.toString());
                                      
                                      }, icon: Icon(Icons.delete))
                                    ],
                                  ),
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
       Center(child: Text(state.registration?.registrations[0].student.toString()??"0"),);
        }
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor:
                    MaterialStateProperty.all(AppColors.blue.withOpacity(0.15)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(AppColors.blue),
              ),
              child: const Text('New Registration'),
              onPressed: () {
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewRegistrationScreen()),
                        );
              
              },
            ),
          ],
        ),
      ),
    );
  }
}
