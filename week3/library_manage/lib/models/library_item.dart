// Abstract class để thể hiện Abstraction (Trừu tượng)
abstract class LibraryItem {
  // Private fields để thể hiện Encapsulation (Đóng gói)
  final String _id;
  final String _title;
  final String _author;
  final int _publicationYear;

  LibraryItem({
    required String id,
    required String title,
    required String author,
    required int publicationYear,
  })  : _id = id,
        _title = title,
        _author = author,
        _publicationYear = publicationYear;

  // Getters để truy cập private fields (Encapsulation)
  String get id => _id;
  String get title => _title;
  String get author => _author;
  int get publicationYear => _publicationYear;

  // Abstract method để thể hiện Polymorphism (Đa hình)
  String getItemType();
  String getDisplayInfo();
}
