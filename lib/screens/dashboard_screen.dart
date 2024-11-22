import 'package:flutter/material.dart';
import 'list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo ocupando toda a tela
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/books.jpeg'),
                fit: BoxFit.cover, // Faz a imagem cobrir toda a tela
              ),
            ),
          ),
          // Conteúdo da tela
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bem-vindo ao Cadastro de Livros',
                  style: TextStyle(
                    color: Colors.white, // Texto visível no fundo
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListScreen()),
                    );
                  },
                  child: const Text('Ver Livros'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
