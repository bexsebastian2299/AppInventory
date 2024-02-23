import 'package:bexpicking_app/src/presentation/providers/splash/splash_provider.dart';
import 'package:bexpicking_app/src/presentation/widgets/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashProvider splashProvider;

  @override
  void initState() {
    splashProvider = Provider.of<SplashProvider>(context, listen: false);
    Future.delayed(
      const Duration(seconds: 3), ()=> splashProvider.initialize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const SplashScreenWidget()),
    );
  }
}