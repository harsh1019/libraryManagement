import 'package:flutter/material.dart';
import 'package:library_managment/models/book_details.dart';
import 'package:library_managment/static/author.dart';

class DetailsByAuthor extends StatelessWidget {
  final String author;
  const DetailsByAuthor(this.author, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10,),
            child: Text(
              author,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: bookOfAuthor.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => BookDetails(
                book: bookOfAuthor[author],
              ),
            ),
          )
        ],
      ),
    );
  }
}
