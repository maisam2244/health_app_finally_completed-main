// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final String conditionText;
  MyTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.conditionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide:
                BorderSide(color: Colors.black, width: 1, strokeAlign: 1),
          ),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 16, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return conditionText;
          }
          return null;
        },
      ),
    );
  }
}
