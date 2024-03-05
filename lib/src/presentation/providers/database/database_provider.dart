// import 'package:bexpicking_app/src/locator.dart';
// import 'package:bexpicking_app/src/services/navigation.dart';
// import 'package:bexpicking_app/src/services/storage.dart';
// import 'package:flutter/foundation.dart';



// final LocalStorageService _storageService = locator<LocalStorageService>();
// final NavigationService _navigationService = locator<NavigationService>();


// class DatabaseProvider extends ChangeNotifier {
//   String? value;

//   initial(){
//     value = null;
//   }

//   setValue(String? v) {
//     value = v!;
//     notifyListeners();
//   }

//   regexFunction(){
//     String regex = '';
//     RegExp regExp = RegExp(regex);
//     return regExp.hasMatch(value ?? '')
//             ? null
//             : 'La empresa no coincide';
//   }


// }