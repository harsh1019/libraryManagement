import 'package:flutter/material.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTextField("Email"),
          buildTextField("FeedBack"),
          buildTextField("Conatact No"),
        ],
      ),
    );
  }

  buildTextField(String title) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: Colors.black,
          ),
        ),
      ),
      width: 500,
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        cursorColor: Colors.white,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
            focusColor: Colors.red,
            hintText: title,
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
