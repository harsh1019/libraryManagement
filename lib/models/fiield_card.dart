import 'package:flutter/material.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({Key? key, required this.title}) : super(key: key);
  final double margin = 20;
  final double width = 500;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      width: width,
      height: 50,
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
        ),
        cursorColor: Colors.black,
        keyboardType: TextInputType.datetime,
        decoration:  InputDecoration(
            focusColor: Colors.red,
            hintText: title,
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all( Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            fillColor: Colors.white,
            filled: true),
      ),
    );
  }
}
