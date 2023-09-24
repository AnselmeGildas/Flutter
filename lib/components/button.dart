import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double rad; 
  final String butText;

  const MyButton({
    super.key,
    required this.rad,
    required this.butText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(rad)),
                  backgroundColor:const Color.fromRGBO(64, 212, 0, 1),
                ),
                onPressed: () {

                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 17, bottom: 17, left: 100, right: 100),
                  child:
                    Text(
                      butText,
                      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 21, fontWeight: FontWeight.bold),
                    )
                ),
              ),
    );
  }
}