import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nullable Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const NullableDemoScreen(),
    );
  }
}

// =====================
// Model
// =====================
class User {
  final String? name;
  final String? email;

  User({this.name, this.email});
}

// =====================
// Screen
// =====================
class NullableDemoScreen extends StatefulWidget {
  const NullableDemoScreen({super.key});

  @override
  State<NullableDemoScreen> createState() => _NullableDemoScreenState();
}

class _NullableDemoScreenState extends State<NullableDemoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  User? user;

  // Chuyển chuỗi rỗng thành null
  String? toNullable(String text) {
    return text.trim().isEmpty ? null : text;
  }

  void handleSubmit() {
    setState(() {
      user = User(
        name: toNullable(nameController.text),
        email: toNullable(emailController.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nullable Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: handleSubmit,
                child: const Text('Hiển thị'),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Kết quả:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text('Name: ${user?.name ?? 'null'}'),
            Text('Email: ${user?.email ?? 'null'}'),
          ],
        ),
      ),
    );
  }
}
