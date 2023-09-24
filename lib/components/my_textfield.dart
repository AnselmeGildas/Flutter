import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
        prefixIcon: Icon(icon,),
        prefixIconColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.focused) ? const Color.fromRGBO(64, 212, 0, 1) : const Color.fromARGB(173, 166, 166, 166) ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(201, 158, 158, 158)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(64, 212, 0, 1)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: const Color.fromRGBO(62, 212, 0, 0.11),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(173, 166, 166, 166))),
      ),
    );
  }
}
