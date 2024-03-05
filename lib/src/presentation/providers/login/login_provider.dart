


import 'package:flutter/material.dart';

import '../../../domain/repositories/api_repository.dart';


class LoginProvider  with ChangeNotifier {
  // final ApiRepository apiRepository;
  List<String> list = <String>['Database 1', 'Database 2'];
  String? dropdownValue;

  LoginProvider(){
    // Initialize the list here if needed
    list = <String>['Database 1', 'Database 2'];
  }





  setDropdownValue(String? v) {
    dropdownValue = v;
    notifyListeners();
  }

  Future<void> initial() async {
    
  }

  // Future<bool> goToLogin() async {
    
  // }

}