class Book {
  final int? id;
  final String title;
  final String author;
  final String genre;
  final int year;
  final String description;

  Book({
    this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.year,
    required this.description,
  });

  // Converte um Map (SQLite) para um objeto Book
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      genre: map['genre'],
      year: map['year'],
      description: map['description'],
    );
  }

  // Converte um objeto Book para um Map (SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'genre': genre,
      'year': year,
      'description': description,
    };
  }
}
