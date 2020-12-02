import 'package:flutter/material.dart';
import 'dart:async';

Timer t;
@override
void showAlertDialog(BuildContext context, text) async {
  String result = await showDialog(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      t = Timer(Duration(milliseconds: 1500), () {
        Navigator.of(context).pop();
      });
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
        ),
        content: Text(text),

        // actions: <Widget>[
        //
          // FlatButton(
          //   child: Text('OK'),
          //   onPressed: () {
          //     Navigator.pop(context, "OK");
          //   },
          // ),
          // FlatButton(
          //   child: Text('Cancel'),
          //   onPressed: () {
          //     Navigator.pop(context, "Cancel");
          //   },
          // ),
        // ],
      );
    },
  );


}

@override
void dispose() {
  t.cancel();
}


