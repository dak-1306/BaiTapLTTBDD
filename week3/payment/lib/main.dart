import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

abstract class PaymentMethod {
  final int id;
  final String name;
  final String assetPath;

  const PaymentMethod(this.id, this.name, this.assetPath);

  // Phương thức trừu tượng để thể hiện đa hình
  Widget icon({double? width, double? height});
}

class GooglePay extends PaymentMethod {
  const GooglePay() : super(1, 'Google Pay', 'assets/google-pay.png');

  @override
  Widget icon({double? width, double? height}) =>
      Image.asset(assetPath, width: width, height: height);
}

class ApplePay extends PaymentMethod {
  const ApplePay() : super(2, 'Apple Pay', 'assets/apple-pay.png');

  @override
  Widget icon({double? width, double? height}) =>
      Image.asset(assetPath, width: width, height: height);
}

class PayPal extends PaymentMethod {
  const PayPal() : super(3, 'PayPal', 'assets/paypal.png');

  @override
  Widget icon({double? width, double? height}) =>
      Image.asset(assetPath, width: width, height: height);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? _selectedId;

  final List<PaymentMethod> paymentMethods = const [
    GooglePay(),
    ApplePay(),
    PayPal(),
  ];

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
                      ? paymentMethods
                            .firstWhere((m) => m.id == _selectedId)
                            .icon(width: 100, height: 100)
                      : Image.asset(
                          'assets/wallet.png',
                          width: 100,
                          height: 100,
                        ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    for (var method in paymentMethods)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: paymentMethodContainer(method),
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

  Material paymentMethodContainer(PaymentMethod method) {
    return Material(
      shadowColor: Colors.blue.shade200,
      borderRadius: BorderRadius.circular(15),
      elevation: 5,
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedId = method.id;
          });
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(20),
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
                    ? const Icon(
                        Icons.circle_rounded,
                        size: 16,
                        color: Colors.blue,
                      )
                    : null,
              ),
              Text(
                method.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: method.icon(width: 45, height: 45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
