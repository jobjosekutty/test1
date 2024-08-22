
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import "package:http/http.dart" as http;
import 'package:studentmanegement/data/models/subject_model.dart';

import '../../core/error_handler.dart';


abstract class SubjectRepo {
  Future<Either<Failure, SubjectModel>> getSubject();
}
@LazySingleton(as: SubjectRepo)
class SubjectRepoImpl extends SubjectRepo {
  
  @override
  Future<Either<Failure, SubjectModel>> getSubject() async {
    try {
      print("testing......");
     // final url = Uri.https.;
      final response = await http.get(Uri.parse('https://nibrahim.pythonanywhere.com/subjects/?api_key=42efb'));
      if (response.statusCode == 200) { 
       final data = subjectModelFromJson(response.body);
      
       return Right(data);
      } else {
        return Left(handleStatusCode(response.statusCode, "error"));
      }
    } catch (e) {
      return Left(handleException(e));
    }
  }
}
