import 'package:flutter/material.dart';

class PaymentDetailsPage extends StatelessWidget {
  final String packageName;
  final String packagePrice;
  final IconData packageIcon;

  const PaymentDetailsPage({
    required this.packageName,
    required this.packagePrice,
    required this.packageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(packageIcon, size: 50),
                SizedBox(height: 20),
                Text(packageName,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Price: $packagePrice', style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Text(
                  'Card Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Card Number'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Expiry Date'),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'CVV'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  'Billing Address',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address Line 1'),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address Line 2'),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'City'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Postal Code'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Pay Now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
