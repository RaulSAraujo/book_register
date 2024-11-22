import 'package:flutter/material.dart';
import '../models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: ListTile(
        leading: const Icon(Icons.book, color: Colors.indigo, size: 40),
        title: Text(
          book.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${book.author} - ${book.genre}'),
        trailing: Text('${book.year}'),
        onTap: () {
          // Aqui você pode adicionar uma ação ao tocar no card
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(book.title),
              content: Text(book.description),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Fechar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
