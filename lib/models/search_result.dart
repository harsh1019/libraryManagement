import 'package:flutter/material.dart';
import 'package:library_managment/models/book_details.dart';
import 'package:library_managment/models/details_by_author.dart';
import 'package:library_managment/static/author.dart';

class SearchResult extends StatelessWidget {
  final String author;
  const SearchResult({Key? key, required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
        children: [
          author != "" ? DetailsByAuthor(author) : Container(),
        ],
      ),
    );
  }
}
