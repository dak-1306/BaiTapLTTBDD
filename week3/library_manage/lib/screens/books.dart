import 'package:flutter/material.dart';

import '../models/book_model.dart';

class BookScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book>? onUpdateBook;

  const BookScreen({super.key, required this.books, this.onUpdateBook});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Danh sách sách',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 8),
              children: books.map((book) {
                return ListTile(
                  title: Text(book.title),
                  leading: Icon(Icons.book),
                  subtitle: Text(book.getDisplayInfo()),
                  trailing: Icon(Icons.edit),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
