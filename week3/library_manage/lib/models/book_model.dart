import 'library_item.dart';

enum BookStatus { available, borrowed }

// Book kế thừa từ LibraryItem (Inheritance - Kế thừa)
class Book extends LibraryItem {
  final BookStatus _status;
  final String? _borrowedId;

  Book({
    required String id,
    required String title,
    required String author,
    required BookStatus status,
    String? borrowedId,
    required int publicationYear,
  })  : _status = status,
        _borrowedId = borrowedId,
        super(
          id: id,
          title: title,
          author: author,
          publicationYear: publicationYear,
        );

  // Getters cho encapsulation
  BookStatus get status => _status;
  String? get borrowedId => _borrowedId;

  // Override methods từ abstract class (Polymorphism - Đa hình)
  @override
  String getItemType() => 'Sách';

  @override
  String getDisplayInfo() =>
      'Sách: $title - Tác giả: $author - Năm: $publicationYear';

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
      status: status ?? _status,
      borrowedId: borrowedId ?? _borrowedId,
      publicationYear: publicationYear ?? this.publicationYear,
    );
  }
}
