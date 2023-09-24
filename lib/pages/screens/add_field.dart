import 'package:flutter/material.dart';


class AddField extends StatelessWidget {
  const AddField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15)
          )
        ),
        title: const Text("Ajouter une nouvelle parcelle", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromRGBO(64, 212, 0, 1),)
    );
    }
  }


