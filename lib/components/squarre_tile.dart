import 'package:flutter/material.dart';

class MysquareTile extends StatelessWidget {
  
  final String linkImage;

  const MysquareTile({
    super.key,
    required this.linkImage,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: const Color.fromARGB(201, 158, 158, 158),
        ),
        color: const Color.fromARGB(13, 156, 156, 156)
      ),
      child: Image.asset(
        linkImage,
        height: 40,
      ),
    );
  }
}