



import 'dart:js';

import 'package:bexpicking_app/src/presentation/views/global/Initial_view.dart';
import 'package:bexpicking_app/src/presentation/views/global/login_view.dart';
import 'package:bexpicking_app/src/presentation/views/global/splash_view.dart';
import 'package:bexpicking_app/src/presentation/views/global/undefined_view.dart';
import 'package:bexpicking_app/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case splashRoute: 
      return MaterialPageRoute(builder: (context) => const SplashView());
    case initialRoute : 
      return MaterialPageRoute(builder: (context) => const InitialView());
    case loginRoute:
      return MaterialPageRoute(builder: (context) => const LoginView());
    default:
      return MaterialPageRoute(
        builder: (context) => UndefinedView(
          name: settings.name,
        ));
  }
}