import 'package:flutter/material.dart';
import 'package:library_managment/classes/student.dart';

class StudentDetails extends StatelessWidget {
  final Student student;
  const StudentDetails(this.student, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: const FlutterLogo(),
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                student.name,
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                student.adminNo,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                student.email,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                student.contactNo,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
