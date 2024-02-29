import 'package:bexpicking_app/src/presentation/providers/initial/initial_provider.dart';
import 'package:bexpicking_app/src/presentation/providers/login/login_provider.dart';
import 'package:bexpicking_app/src/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late LoginProvider loginProvider;
  
  @override
  void initState() {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.initial();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    var value = context.watch<LoginProvider>().dropdownValue;
    final list = context.read<LoginProvider>().list;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: _buildBodySuccess(list, value),
        )
      ),
    );
  }


  Widget _buildBodySuccess(value, list){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(100),
            child: Image.asset(
              'assets/images/wms-icon.png',
              fit: BoxFit.contain,
            ),),
          Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: kDefaultPadding,
              //     right: kDefaultPadding,
              //     bottom: kDefaultPadding),
              //   child: DropdownButtonFormField(
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12)),
              //     ),
              //     value: value,
              //     dropdownColor: const Color(0xFFFFDAD3),
              //     icon: const Icon(Icons.arrow_downward),
              //     elevation: 16,
              //     onChanged: (Object? value) => loginProvider.setDropdownValue(value as String?),
              //     items: list.map<DropdownMenuItem<String>>((String value){
              //       return DropdownMenuItem<String>(
              //         value: value, child: Text(value),
              //       );
              //     }).toList(),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding),
                child: TextFormField(
                  // controller: ,
                  style: const TextStyle(color: Colors.black),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: '@gmail',
                    labelText: 'Correo electronico',
                    suffixIcon: const SizedBox(
                      child: Center(
                        widthFactor: 1.1,
                        child: Text(
                          '',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always
                  ),
                  validator: (value) {
                    String pattern = 
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El valor inggresado no luce como un correo';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: '******',
                    labelText: 'Contraseña',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: const SizedBox(
                      child: Center(
                        widthFactor: 1.1,
                        child: Text(
                          '',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}