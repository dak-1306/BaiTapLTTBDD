import 'package:flutter/material.dart';
import './home.dart';
import './books.dart';
import './user.dart';
import '../models/user_model.dart';
import '../data/books_data.dart';
import '../models/book_model.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  User? _currentUser;
  final List<User> users = [];

  // MainLayout giữ danh sách sách (sao chép sampleBooks để không thay đổi gốc)
  final List<Book> books = List<Book>.from(sampleBooks);

  void _setCurrentUser(User user) {
    setState(() {
      _currentUser = user;
      if (!users.any((u) => u.id == user.id)) users.add(user);
    });
  }

  // cập nhật 1 quyển sách (Home/Books gọi)
  void _updateBook(Book updated) {
    final i = books.indexWhere((b) => b.id == updated.id);
    if (i != -1) {
      setState(() => books[i] = updated);
    }
  }

  List<Widget> get _pages => [
    HomeScreen(
      users: users,
      currentUser: _currentUser,
      onUserSelected: _setCurrentUser,
      books: books,
      onUpdateBook: _updateBook,
    ),
    BookScreen(books: books, onUpdateBook: _updateBook),
    UserScreen(users: users, books: books),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Quản Lý Thư Viện',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Books'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
        ],
      ),
    );
  }
}
