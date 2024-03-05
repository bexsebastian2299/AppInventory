import 'package:flutter/material.dart';





class FormAutovalidate extends StatefulWidget {
  final Widget child;
  final GlobalKey<FormState> keyForm;

  const FormAutovalidate({Key? key, required this.child, required this.keyForm})
      : super(key: key);

  @override
  FormAutovalidateState createState() => FormAutovalidateState();
}

class FormAutovalidateState extends State<FormAutovalidate> {
  late AutovalidateMode _autoValidate;

  @override
  void initState() {
    super.initState();
    _autoValidate = AutovalidateMode.disabled;
  }

  bool validateForm() {
    final isValidate = widget.keyForm.currentState?.validate();
    if (!isValidate!) setState(() => _autoValidate = AutovalidateMode.always);
    return isValidate;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.keyForm,
      autovalidateMode: _autoValidate,
      child: widget.child,
    );
  }
}

