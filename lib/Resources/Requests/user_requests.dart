import 'package:flutter/material.dart';
import 'package:health/Resources/AppColors/app_colors.dart';

class Requests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text(
          "Your Requests:",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        buildRequestTile("Requested for Laboratory Service", MyColors.red,
            "Date: Dec 16, 2023", false),
        buildRequestTile("Requested for Drips & Fluids Service", MyColors.red,
            "Date: Dec 9, 2023", false),
        buildRequestTile("Requested for Virtual Consultation", MyColors.red,
            "Date: Dec 5, 2023", false),
        buildRequestTile("Requested for Nurse Visit", MyColors.liteGreen,
            "Date: Nov 12, 2023", true),
        buildRequestTile("Requested for Drips & Fluids Service",
            MyColors.liteGreen, "Date: Nov 2, 2023", true),
      ],
    );
  }

  Widget buildRequestTile(String requestText, Color tileColor, String subtitle,
      bool showCompletedButton) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        tileColor: tileColor,
        title: Text(
          requestText,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.white)),
        trailing: showCompletedButton
            ? IconButton(
                icon: Icon(Icons.check, color: Colors.white),
                onPressed: () {},
              )
            : null,
      ),
    );
  }
}
