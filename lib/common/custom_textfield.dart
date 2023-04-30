import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  const CustomTextfield(
      {Key? key,
      required this.controller,
      required this.hinText,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:  InputDecoration(
        hintText: hinText,
        border:const OutlineInputBorder(borderSide: BorderSide(color: GlobalVariables.secondaryColor)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: GlobalVariables.secondaryColor)),
      ),
      validator:(val){}
    );
  }
}
