import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Resources/AppColors/app_colors.dart';

class Provider_Completed_Requests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text(
          "Completed Requests:".tr,
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
        buildRequestTile("Name", "Address: ABC Road , XYZ City", 4),
        buildRequestTile("Name", "Address: ABC Road , XYZ City", 5),
      ],
    );
  }

  Widget buildRequestTile(String title, String description, int elevation) {
    return Card(
      elevation: elevation.toDouble(),
      child: ListTile(
        tileColor: MyColors.liteGreen,
        title: Text(title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        subtitle: Text(description, style: TextStyle(color: Colors.white)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
