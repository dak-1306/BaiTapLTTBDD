import 'package:flutter/material.dart';

// Bài tập 1:
// Tạo 1 màn hình đơn giản hiển thị ảnh đại diện, tên và lớp học của bạn
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () {}, child: Icon(Icons.arrow_back)),
              SizedBox(width: 10), // Spacer between buttons
              ElevatedButton(onPressed: () {}, child: Icon(Icons.edit)),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('assets/test.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Tran Hai Dang',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Lop: CN2302CLCA', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
