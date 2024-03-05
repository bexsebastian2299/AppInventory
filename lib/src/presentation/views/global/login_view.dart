import 'package:bexpicking_app/src/presentation/providers/initial/initial_provider.dart';
import 'package:bexpicking_app/src/presentation/providers/login/login_provider.dart';
import 'package:bexpicking_app/src/presentation/views/user/home/index.dart';
import 'package:bexpicking_app/src/presentation/widgets/default_button.dart';
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
  bool isLoading = false;
  bool showSuffix = true;
  
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

    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: _buildBodySuccess( value),
          )
        ),
      ),
    );
  }


  Widget _buildBodySuccess(value ){

    String dropdownValue = 'Database 1';

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
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))
                  ),
                  value: dropdownValue,
                  dropdownColor: const Color(0xFFFFDAD3),
                  icon: const Icon(Icons.menu),
                  style: const TextStyle(color: Colors.black),
                  onChanged: (String? newValue){
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Database 1',
                      child: Text('Database 1')
                    ),
                    DropdownMenuItem<String>(
                      value: 'Database 2',
                      child: Text('Database 2')
                    ),
                    DropdownMenuItem<String>(
                      value: 'Database 3',
                      child: Text('Database 3')
                    )
                  ],
                ),
              ),

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
              ),
              Column(
                children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      bottom: kDefaultPadding
                    ),
                  child: DefaultButton(
                      widget: isLoading 
                      ? const CircularProgressIndicator(
                        valueColor: 
                            AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                      : Text('Ingresar'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                        ),
                      ),
                      press: () async {
                        setState(() {
                          //aqui vamos a navegar a la otra ruta
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => HomeView())
                          );
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}