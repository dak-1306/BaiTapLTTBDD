import 'library_item.dart';

// Magazine kế thừa từ LibraryItem (Inheritance - Kế thừa)
// Demo thêm một loại item khác để thể hiện đa hình rõ ràng hơn
class Magazine extends LibraryItem {
  final int _issueNumber;
  final String _publisher;

  Magazine({
    required String id,
    required String title,
    required String author,
    required int publicationYear,
    required int issueNumber,
    required String publisher,
  })  : _issueNumber = issueNumber,
        _publisher = publisher,
        super(
          id: id,
          title: title,
          author: author,
          publicationYear: publicationYear,
        );

  // Getters cho encapsulation
  int get issueNumber => _issueNumber;
  String get publisher => _publisher;

  // Override methods từ abstract class (Polymorphism - Đa hình)
  @override
  String getItemType() => 'Tạp chí';

  @override
  String getDisplayInfo() =>
      'Tạp chí: $title - Số: $_issueNumber - NXB: $_publisher - Năm: $publicationYear';
}
