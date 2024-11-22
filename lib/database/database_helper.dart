import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/book.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  static DatabaseHelper get instance => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'books.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE books (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            author TEXT,
            genre TEXT,
            year INTEGER,
            description TEXT
          )
        ''');
      },
    );
  }

  // Função para obter todos os livros
  Future<List<Book>> getAllBooks() async {
    final db = await database;
    final result =
        await db.query('books'); // Busca todos os registros da tabela "books"
    return result.map((map) => Book.fromMap(map)).toList();
  }

  // Função para inserir um livro
  Future<int> insertBook(Book book) async {
    final db = await database;
    return await db.insert('books', book.toMap());
  }
}
