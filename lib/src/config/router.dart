
import 'package:bexpicking_app/src/presentation/views/global/Initial_view.dart';
import 'package:bexpicking_app/src/presentation/views/global/login_view.dart';
import 'package:bexpicking_app/src/presentation/views/global/splash_view.dart';
import 'package:bexpicking_app/src/presentation/views/global/undefined_view.dart';
import 'package:bexpicking_app/src/presentation/views/packing/index.dart';
import 'package:bexpicking_app/src/presentation/views/picking/index.dart';
import 'package:bexpicking_app/src/presentation/views/user/home/index.dart';
import 'package:bexpicking_app/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case splashRoute: 
      return MaterialPageRoute(builder: (context) => const SplashView());
    case initialRoute : 
      return MaterialPageRoute(builder: (context) => const InitialView()); //este es el primer login
    case loginRoute:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case homeRoute:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case pickingRoute:
      return MaterialPageRoute(builder: (context) => const PickingView());
    case packingRoute:
      return MaterialPageRoute(builder: (context) => const PackingView());
    default: 
      return MaterialPageRoute(
        builder: (context) => UndefinedView(
          name: settings.name,
        ));
  }
}