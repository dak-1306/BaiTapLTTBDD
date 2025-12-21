import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  final List<User> users;
  final User? currentUser;
  final ValueChanged<User>? onUserSelected;
  final List<Book> books;
  final ValueChanged<Book>? onUpdateBook;
  HomeScreen({
    super.key,
    required this.users,
    this.currentUser,
    this.onUserSelected,
    required this.books,
    this.onUpdateBook,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _userNameController = TextEditingController();
  User? _currentUser;
  final Set<String> _selectedBookIds = {}; // lưu id sách được chọn

  @override
  void initState() {
    super.initState();
    _currentUser = widget.currentUser;
    if (_currentUser != null) _userNameController.text = _currentUser!.name;
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentUser?.id != oldWidget.currentUser?.id) {
      _currentUser = widget.currentUser;
      _userNameController.text = _currentUser?.name ?? '';
    }
  }

  void _toggleSelection(String bookId) {
    setState(() {
      if (_selectedBookIds.contains(bookId)) {
        _selectedBookIds.remove(bookId);
      } else {
        _selectedBookIds.add(bookId);
      }
    });
  }

  bool _isBorrowedByAny(String bookId) {
    return widget.users.any((u) => u.borrowedBookIds.contains(bookId));
  }

  void _assignSelectedToCurrentUser() {
    if (_currentUser == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Chưa chọn người dùng')));
      return;
    }
    for (final id in _selectedBookIds) {
      final idx = widget.books.indexWhere((b) => b.id == id);
      if (idx == -1) continue;
      final book = widget.books[idx];
      if (book.status != BookStatus.borrowed) {
        final updated = book.copyWith(
          status: BookStatus.borrowed,
          borrowedId: _currentUser!.id,
        );
        widget.onUpdateBook?.call(updated);
      }
      if (!_currentUser!.borrowedBookIds.contains(id))
        _currentUser!.borrowedBookIds.add(id);
    }
    setState(() => _selectedBookIds.clear());
    widget.onUserSelected?.call(_currentUser!);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Đã gán sách cho người dùng')));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Người dùng',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tên người dùng',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final name = _userNameController.text.trim();
                    if (name.isEmpty) return;
                    // tìm user có sẵn hoặc tạo mới
                    final existing = widget.users.firstWhere(
                      (u) => u.name.toLowerCase() == name.toLowerCase(),
                      orElse: () {
                        final newUser = User(
                          id: DateTime.now().toString(),
                          name: name,
                          borrowedBookIds: [],
                        );
                        widget.users.add(newUser);
                        return newUser;
                      },
                    );
                    setState(() {
                      _currentUser = existing;
                      _userNameController.text = _currentUser?.name ?? '';
                    });
                    widget.onUserSelected?.call(existing);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    'Đổi',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Danh sách sách',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 166, 166, 166),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.builder(
                  itemCount: widget.books.length,
                  itemBuilder: (context, index) {
                    final book = widget.books[index];
                    final selected = _selectedBookIds.contains(book.id);
                    final borrowed = _isBorrowedByAny(book.id);
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        onTap: () => _toggleSelection(book.id),
                        leading: Checkbox(
                          value: selected,
                          onChanged: (_) => _toggleSelection(book.id),
                          activeColor: Colors.green,
                        ),
                        title: Text(book.title),
                        subtitle: Text(
                          'Tác giả: ${book.author} - Năm xuất bản: ${book.publicationYear}',
                        ),
                        trailing: borrowed
                            ? const Text(
                                'Đã mượn',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                backgroundColor: Colors.green,
              ),
              child: Text(
                'Thêm',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: _assignSelectedToCurrentUser,
            ),
          ],
        ),
      ),
    );
  }
}
