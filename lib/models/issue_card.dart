import 'package:flutter/material.dart';
import 'package:library_managment/models/fiield_card.dart';

class IssueCard extends StatefulWidget {
  const IssueCard({Key? key}) : super(key: key);

  @override
  State<IssueCard> createState() => _IssueCardState();
}

class _IssueCardState extends State<IssueCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: const Text(
            "Search Here",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        const FieldCard(title: "Issue Date"),
        const FieldCard(title: "Book Name"),
        const FieldCard(title: "Author Name"),
        const FieldCard(title: "Cat."),
        Container(
          height: 60,
          width: 300,
          margin: const EdgeInsets.only(bottom: 40,top: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.8),
                Colors.blue.shade900,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: const Text(
            "Search Book",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ],
    );
  }
}
