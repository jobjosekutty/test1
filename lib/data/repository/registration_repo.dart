import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import "package:http/http.dart" as http;

import '../../core/error_handler.dart';
import '../models/classroom_model.dart';
import '../models/registration_model.dart';
import '../models/student_model.dart';

abstract class RegistrationRepo {
  Future<Either<Failure, RegistrationModel>>  getRegistration();
  Future<Either<Failure, String>>  registrationDelete(String id);
}
@LazySingleton(as: RegistrationRepo)
class RegistrationRepoImpl extends RegistrationRepo {
  
  @override
  Future<Either<Failure, RegistrationModel>> getRegistration() async {
    try {
      print("registration......");
     // final url = Uri.https.;
      final response = await http.get(Uri.parse('https://nibrahim.pythonanywhere.com/registration/?api_key=42efb'));
      if (response.statusCode == 200) { 
       final data = registrationModelFromJson(response.body);
       log(response.body);
      
       return Right(data);
      } else {
        return Left(handleStatusCode(response.statusCode, "error"));
      }
    } catch (e) {
      return Left(handleException(e));
    }
  }
  
  @override
  Future<Either<Failure, String>> registrationDelete(String id)async {
    print("DELETE!!!");
       try {
     final response = await http.delete(Uri.parse('https://nibrahim.pythonanywhere.com/registration/$id?api_key=42efb'));
     log(response.body);
      
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        return Right(jsondata["message"]);
      } else {
 return Left(handleStatusCode(response.statusCode, "error"));
      }
    } catch (e) {
      return Left(handleException(e));
    }
    
  }
}
