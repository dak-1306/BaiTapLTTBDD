import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String? email = '';
String state = '';
bool success = false;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bài thực hành 2',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bài thực hành 2', style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  // Xử lý khi giá trị thay đổi
                  email = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 10),
              (state != '' && success)
                  ? Text(
                      state,
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    )
                  : SizedBox(height: 0),
              (state != '' && !success)
                  ? Text(
                      state,
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    )
                  : SizedBox(height: 0),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Xử lý khi nút được nhấn

                  if (email == '' || email == null) {
                    setState(() {
                      state = 'Email không hợp lệ';
                      success = false;
                    });
                  } else {
                    if (!email!.contains('@')) {
                      setState(() {
                        state = 'Email không đúng định dạng';
                        success = false;
                      });
                      return;
                    }

                    setState(() {
                      state = 'Bạn đã nhập email hợp lệ';
                      success = true;
                    });
                  }
                },

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.blue,
                  ),
                ),
                child: Text('Kiểm tra', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
