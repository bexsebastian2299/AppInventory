// ignore: file_names
import 'package:bexpicking_app/src/presentation/views/global/login_view.dart';
import 'package:bexpicking_app/src/presentation/widgets/default_button.dart';
import 'package:bexpicking_app/src/utils/constants/enums.dart';
import 'package:flutter/material.dart';


class InitialView extends StatefulWidget {
  const InitialView({super.key});

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {

  bool isLoading = false;
  // final FocusNode _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBody()
        ],
      )
    );
  }
  //body of the page
  Widget _buildBody(){
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 50,),
          Image.asset('assets/images/wms-icon.png', width: 300,),
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding,
            ),
            child: TextFormField(
              // controller: ,
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
                  : Text('Comenzar'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white
                    ),
                  ),
                  press: () async {
                    setState(() {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => LoginView())
                      );
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}