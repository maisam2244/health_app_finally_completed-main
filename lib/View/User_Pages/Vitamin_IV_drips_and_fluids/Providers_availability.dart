import 'package:flutter/material.dart';

class ProvidersAvailability extends StatelessWidget {
  const ProvidersAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Sorry no providers available yet",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    ));
  }
}
