// User với Encapsulation (đóng gói) sử dụng private fields và getters
class User {
  final String _id;
  final String _name;
  final List<String> _borrowedBookIds;

  User({
    required String id,
    required String name,
    List<String>? borrowedBookIds,
  })  : _id = id,
        _name = name,
        _borrowedBookIds = borrowedBookIds ?? [];

  // Getters để truy cập private fields (Encapsulation)
  String get id => _id;
  String get name => _name;
  List<String> get borrowedBookIds => _borrowedBookIds;

  // Method để thêm sách mượn
  void addBorrowedBook(String bookId) {
    if (!_borrowedBookIds.contains(bookId)) {
      _borrowedBookIds.add(bookId);
    }
  }

  // Method để trả sách
  void returnBook(String bookId) {
    _borrowedBookIds.remove(bookId);
  }
}
