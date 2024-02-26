// ignore: file_names
import 'package:flutter/material.dart';


class InitialView extends StatefulWidget {
  const InitialView({super.key});

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox( height: 50,),
          Image.asset('assets/images/wms-icon.png', width: 300,),
          const SizedBox( height: 20,),
          TextFormField(
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFf44336))),
              border: const OutlineInputBorder(
                borderSide:  BorderSide(width: 2, color: Color(0xFFf44336))),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Color(0xFFf44336)),
              borderRadius: BorderRadius.circular(50.0))
            ),
          ),
          
        ],
      ),
    );
  }
}