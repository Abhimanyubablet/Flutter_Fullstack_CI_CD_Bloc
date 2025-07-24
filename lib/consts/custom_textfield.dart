import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final EdgeInsets contentPadding;
  const CustomTextfield(
      {super.key,
      this.controller,
      required this.hintText,
        this.contentPadding = const EdgeInsets.all(16.0),
        required this.onChanged,
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:TextStyle(fontWeight: FontWeight.w300,fontSize: 14),
          border: OutlineInputBorder(
            borderRadius:BorderRadius.circular(10.0),
             borderSide:BorderSide.none
          ),
        contentPadding: contentPadding,
        filled: true,
        fillColor: Colors.white
      ),
    );
  }
}
