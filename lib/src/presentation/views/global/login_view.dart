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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: _buildBodySuccess(),
        )
      ),
    );
  }


  Widget _buildBodySuccess(){
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