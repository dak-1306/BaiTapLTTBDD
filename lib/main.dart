import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/test.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Nguyen Van A',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Lop: 19TCLC_DT1', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
