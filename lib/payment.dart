import 'package:flutter/material.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  final String merchantId = "1232915";
  final String merchantSecret = "ODI3NTcxMDE3MTc5ODk1MjE3NDM1Njc3MTc5MDAxNTQwNDA0MTY4";

  void startPayment() {
    Map paymentObject = {
      "sandbox": true,
      "merchant_id": merchantId,
      "merchant_secret": merchantSecret, 
      "notify_url": "https://webhook.site/your-endpoint", // Optional - for server notifications
      "order_id": "ItemNo${DateTime.now().millisecondsSinceEpoch}",
      "items": "Sample Item Purchase",
      "amount": 1500.00,
      "currency": "LKR",
      "first_name": "Test",
      "last_name": "User",
      "email": "testuser@gmail.com",
      "phone": "0771234567",
      "address": "No. 1, Galle Road",
      "city": "Colombo",
      "country": "Sri Lanka",
      "delivery_address": "No. 1, Galle Road",
      "delivery_city": "Colombo",
      "delivery_country": "Sri Lanka",
      "custom_1": "",
      "custom_2": ""
    };

    PayHere.startPayment(
      paymentObject,
      (paymentId) {
        print("Payment Success! Payment ID: $paymentId");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Payment Success! ID: $paymentId"),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      },
      (error) {
        print("Payment Error: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Payment Failed: $error"),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      },
      () {
        print("Payment Dismissed");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Payment Cancelled by User"),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 3),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PayHere Test Payment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.payment, size: 80, color: Colors.blue),

            const SizedBox(height: 20),

            const Text(
              "Test PayHere Payment",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Click the button below to test payment in PayHere Sandbox.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: startPayment,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Pay Now (Rs. 1500)"),
            ),
          ],
        ),
      ),
    );
  }
}
