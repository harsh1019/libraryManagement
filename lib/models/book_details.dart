import 'package:flutter/material.dart';

import '../classes/book.dart';

class BookDetails extends StatelessWidget {
  final Book? book;
  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.asset("assets/images/logo.png"),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                book!.bookName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              for (int i = 0; i < book!.authorName.length; i++)
                Text(book!.authorName[i]),
            ],
          ),
        ],
      ),
    );
  }
}
