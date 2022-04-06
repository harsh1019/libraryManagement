import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:library_managment/effects/hover_effect.dart';

class HoveredText extends StatelessWidget {
  final String title;
  const HoveredText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverEffect(
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      color: const Color(0xff8e2525),
    );
  }
}
