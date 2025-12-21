import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/book_model.dart';

class UserScreen extends StatelessWidget {
  final List<Book> books;
  const UserScreen({super.key, required this.users, required this.books});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Danh sách nhân viên',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 8),
              children: users.isEmpty
                  ? [
                      Center(
                        child: Text(
                          'Không có người dùng nào.',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ]
                  : users.map((user) {
                      return ListTile(
                        title: Text(user.name),
                        leading: Icon(Icons.person),
                        subtitle: Text(
                          'danh sách sách đã mượn: ${user.borrowedBookIds.join(', ')}',
                        ),

                        trailing: Icon(Icons.edit),
                      );
                    }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
