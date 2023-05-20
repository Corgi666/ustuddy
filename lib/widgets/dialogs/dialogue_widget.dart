import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }
  static Widget questionStatrDialogue({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi....",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            "Please login before you start",
            style: TextStyle(fontSize: 16, color: Colors.black45),
          )
        ],
      ),
      actions: [TextButton(onPressed: onTap, child: Text("Confirm"))],
    );
  }
}
