import 'package:bexpicking_app/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';


class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => SplashScreenWidgetState();
}

class SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // Image.asset('assets/images/icon.png',
                  //   width: 400.0, height: 400.0),
                  const CircularProgressIndicator(
                    valueColor: 
                    AlwaysStoppedAnimation<Color>(kPrimaryColor),
                  )
                ],
              )
            )
          ],
        )
      ],
    );
  }
}