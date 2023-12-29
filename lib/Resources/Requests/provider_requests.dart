import 'package:flutter/material.dart';
import 'package:health/Resources/AppColors/app_colors.dart';

class Provider_Requests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text(
          "Pending Requests:",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        buildRequestTile("Name", "Address: ABC Road , XYZ City", 1),
        buildRequestTile("Name", "Address: ABC Road , XYZ City", 2),
        buildRequestTile("Name", "Address: ABC Road , XYZ City", 3),
      ],
    );
  }

  Widget buildRequestTile(String title, String description, int elevation) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Adjust the value as needed
      ),
      elevation: elevation.toDouble(),
      child: ListTile(
        tileColor: MyColors.yellow,
        title: Text(title, style: TextStyle(color: Colors.black)),
        subtitle: Text(description, style: TextStyle(color: Colors.black)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.check, color: Colors.green),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
