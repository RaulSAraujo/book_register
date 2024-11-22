import 'package:flutter/material.dart';
import '../models/book.dart';
import '../database/database_helper.dart';

class FormScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Livro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(labelText: 'Autor'),
            ),
            TextField(
              controller: genreController,
              decoration: const InputDecoration(labelText: 'Gênero'),
            ),
            TextField(
              controller: yearController,
              decoration: const InputDecoration(labelText: 'Ano de Publicação'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descrição'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Criação do objeto Book
                final book = Book(
                  title: titleController.text,
                  author: authorController.text,
                  genre: genreController.text,
                  year: int.tryParse(yearController.text) ?? 0,
                  description: descriptionController.text,
                );

                // Salva no banco
                await dbHelper.insertBook(book);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Livro cadastrado com sucesso!')),
                );
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
