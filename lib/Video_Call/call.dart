import 'package:flutter/material.dart';
import 'package:health/Video_Call/consts.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class MyCall extends StatelessWidget {
  const MyCall({Key? key, required this.callID, required this.userEmail})
      : super(key: key);

  final String callID;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: MyConst.appID,
      appSign: MyConst.appSign,
      userID: userEmail,
      userName: userEmail,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}
