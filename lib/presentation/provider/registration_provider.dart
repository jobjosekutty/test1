import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:studentmanegement/data/repository/registration_repo.dart';

import '../../core/error_handler.dart';
import '../../data/models/classroom_model.dart';
import '../../data/models/registration_model.dart';
import '../../data/repository/classroom_repo.dart';



@injectable
class RegistrationProvider extends ChangeNotifier {
 final RegistrationRepo _registrationRepo;

  RegistrationProvider({required RegistrationRepo registrationRepo}) : _registrationRepo = registrationRepo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Failure? _failure;

  Failure? get homeFailure => _failure;
  set setFailure(Failure? value) {
    _failure = value;
    notifyListeners();
  }

RegistrationModel? registration;

  Future<void> getRegistartion() async {
 
      setLoading = true;
       setFailure =null;
    final res = await _registrationRepo.getRegistration();
    res.fold((error) {
     
      setFailure = error;
      setLoading = false;
    }, (data) {
    ///  log(data.classrooms.toString());
     registration = data;
    //  print(students?.toJson())
;      notifyListeners();
      setLoading = false;
    });
  }

  //delete
    Future<void> registrationDelete(String id) async {
 
      setLoading = true;
       setFailure =null;
    final res = await _registrationRepo.registrationDelete(id);
    res.fold((error) {
     
      setFailure = error;
      setLoading = false;
    }, (data) {
    ///  log(data.classrooms.toString());
     //registration = data;
    //  print(students?.toJson())
;      notifyListeners();
      setLoading = false;
    });
  }
}
