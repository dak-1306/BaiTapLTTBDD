import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

int input1 = 0;
int input2 = 0;
String operator = '';
String result = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bài thực hành số 3',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ButtonOperator extends StatelessWidget {
  final String operator;
  final Color color;
  final Function onPressed;
  ButtonOperator({
    required this.operator,
    required this.color,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(
        operator,
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bài thực hành số 3'),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    input1 = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập dữ liệu',
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonOperator(
                    operator: '+',
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        operator = '+';
                        result = (input1 + input2).toString();
                      });
                    },
                  ),

                  ButtonOperator(
                    operator: '-',
                    color: Colors.yellow,
                    onPressed: () {
                      setState(() {
                        operator = '-';
                        result = (input1 - input2).toString();
                      });
                    },
                  ),
                  ButtonOperator(
                    operator: '*',
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        operator = '*';
                        result = (input1 * input2).toString();
                      });
                    },
                  ),
                  ButtonOperator(
                    operator: '/',
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        operator = '/';
                        if (input2 != 0) {
                          result = (input1 / input2).toString();
                        } else {
                          result = 'Error: Division by zero';
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    input2 = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập dữ liệu',
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Kết quả: $result'),
          ],
        ),
      ),
    );
  }
}
