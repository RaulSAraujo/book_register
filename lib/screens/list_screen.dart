import 'package:flutter/material.dart';
import '../models/book.dart';
import '../database/database_helper.dart';
import 'form_screen.dart';
import '../widgets/book_card.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    _loadBooks(); // Carrega os livros ao iniciar a tela
  }

  Future<void> _loadBooks() async {
    final data = await dbHelper.getAllBooks();
    setState(() {
      books = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Livros Cadastrados')),
      body: books.isEmpty
          ? const Center(child: Text('Nenhum livro cadastrado ainda!'))
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) => BookCard(book: books[index]),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen()),
          );
          _loadBooks(); // Recarrega a lista após o cadastro
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
