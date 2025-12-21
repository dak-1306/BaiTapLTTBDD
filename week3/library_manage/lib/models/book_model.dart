enum BookStatus { available, borrowed }

class Book {
  final String id;
  final String title;
  final String author;
  final BookStatus status;
  final String? borrowedId;
  final int publicationYear;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.status,
    this.borrowedId,
    required this.publicationYear,
  });

  Book copyWith({
    String? id,
    String? title,
    String? author,
    BookStatus? status,
    String? borrowedId,
    int? publicationYear,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      status: status ?? this.status,
      borrowedId: borrowedId ?? this.borrowedId,
      publicationYear: publicationYear ?? this.publicationYear,
    );
  }
}
