import 'package:flutter/material.dart';


@override
void showAlertDialog(BuildContext context, text) async {
  String result = await showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {

      Future.delayed(Duration(milliseconds: 1500), (){
        Navigator.pop(context);
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



