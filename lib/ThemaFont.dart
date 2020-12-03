import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

//var themaFont = Provider<String>.value(value: 'Cafe24Dajunghae', child: Container(),);


final themaFontList=['나눔바른고딕','Cafe24Dajunghae','Cafe24Dongdong','Cafe24Oneprettynight',
'Cafe24Shiningstar','Maplestory OTF Light','MaruBuri-Regular','Shrikhand-Regular'];


class themaFont with ChangeNotifier {
  String _tFont = 'Shrikhand-Regular';

  String getFont() => _tFont;

  void ChangeFont(String value) {
    _tFont= value;
    notifyListeners(); //must be inserted
  }
}