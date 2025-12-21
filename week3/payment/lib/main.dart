import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class PaymentMethod {
  final int id;
  final String name;
  final String assetPath;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.assetPath,
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? _selectedId;

  List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      id: 1,
      name: 'Google Pay',
      assetPath: 'assets/google-pay.png',
    ),
    PaymentMethod(id: 2, name: 'Apple Pay', assetPath: 'assets/apple-pay.png'),
    PaymentMethod(id: 3, name: 'PayPal', assetPath: 'assets/paypal.png'),
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment App',
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: _selectedId != null
                      ? Image.asset(
                          paymentMethods
                              .firstWhere((method) => method.id == _selectedId)
                              .assetPath,
                        )
                      : Image.asset('assets/wallet.png'),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    for (var method in paymentMethods)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: PaymentMethodContainer(method),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Material PaymentMethodContainer(PaymentMethod method) {
    return Material(
      shadowColor: Colors.blue.shade200,
      borderRadius: BorderRadius.circular(15),
      elevation: 5,
      child: InkWell(
        onTap: () {
          // Handle tap event
          setState(() {
            _selectedId = method.id;
          });
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _selectedId == method.id
                        ? Colors.blue
                        : Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                child: _selectedId == method.id
                    ? Icon(Icons.circle_rounded, size: 16, color: Colors.blue)
                    : null,
              ),
              Text(
                method.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: Image.asset(method.assetPath),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
