import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
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
          labelText: hintText,
          labelStyle: const TextStyle(color: Color.fromARGB(173, 166, 166, 166)),
          prefixIcon: Icon(
            icon,
            color: const Color.fromARGB(173, 166, 166, 166)
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(201, 158, 158, 158))
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(64, 212, 0, 1))
          ),
          fillColor: const Color.fromRGBO(62, 212, 0, 0.11),
          filled: true,
        ),
      ),
    );
  }
}
    
