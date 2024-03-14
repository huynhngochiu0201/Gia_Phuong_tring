import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.controller, required this.textController});

  final TextEditingController controller;
  final String textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          hintText: textController,
          labelText: textController,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
  }
}
