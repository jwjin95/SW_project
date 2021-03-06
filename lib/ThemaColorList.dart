import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

final themaList = [
  '카페','산토리니','레트로','파스텔 팝','모노톤'
];
class mainThema with ChangeNotifier {
  String _mainThema = '카페';
  var _colorList = themaCafe;
  String getThema() => _mainThema;
  Map getThemaList()=>_colorList;
  void ChangeThema(String value) {
    _mainThema= value;
    switch(_mainThema){
      case '카페':
        _colorList=themaCafe;
        break;
      case '산토리니':
        _colorList=themaSantorini;
        break;
      case '레트로':
        _colorList=themaRetro;
        break;
      case '파스텔 팝':
        _colorList=themaPop;
        break;
      case '모노톤':
        _colorList=themaMono;
        break;
    }
    notifyListeners(); //must be inserted
  }
}

final themaCafe={'배경색': 0xFFFAF8F5, '어플상하단색': 0xFFD1BEA5,
  '어플상하단글씨':0xFF4C3825, '아이콘':0xFF4C3825,
  '달력상단':0xFF4C3825, '달력요일글씨':0xFF4C3825,
  'SELECTED':0xFF7A3815,'선택글씨': 0xFFFAF8F5,'TODAY':0xFF7A3815,
  '달력일기쓴날':0xFFD1BEA5, '달력하단날짜':0xFF4C3825,
  '상세보기':0xFF4C3825, '대화창말풍선':0xFFD1BEA5,
  '대화창글씨':0xFF4C3825, '버튼글씨':0xFF4C3825,
  '버튼테두리':0xFFD1BEA5, '버튼배경색':0xFFFAF8F5
};
final themaSantorini={'배경색': 0xFFFFFFFF, '어플상하단색': 0xFF597CD0,
  '어플상하단글씨':0xFFFFFFFF, '아이콘':0xFFFFFFFF,
  '달력상단': 0xFF597CD0, '달력요일글씨': 0xFF597CD0,
  'SELECTED':0xFFB6C7F2,'선택글씨': 0xFFFFFFFF,'TODAY':0xFFB6C7F2,
  '달력일기쓴날': 0xFF597CD0, '달력하단날짜':0xFF597CD0,
  '상세보기':0xFF597CD0, '대화창말풍선':0xFFB6C7F2,
  '대화창글씨':0xFF597CD0, '버튼글씨':0xFF597CD0,
  '버튼테두리':0xFFB6C7F2, '버튼배경색':0xFFFFFFFF
};
final themaRetro={'배경색': 0xFFFFFDF2, '어플상하단색': 0xFFFFDB0A,
  '어플상하단글씨':0xFF537C24, '아이콘':0xFF537C24,
  '달력상단':0xFF7A3815, '달력요일글씨':0xFF7A3815,
  'SELECTED':0xFF537C24,'선택글씨': 0xFFFFFDF2,'TODAY':0xFF537C24,
  '달력일기쓴날':0xFFFFDB0A, '달력하단날짜':0xFF537C24,
  '상세보기':0xFF7A3815, '대화창말풍선':0xFF537C24,
  '대화창글씨':0xFFFFDB0A, '버튼글씨':0xFF537C24,
  '버튼테두리':0xFF7A3815, '버튼배경색':0xFFFFFDF2
};
final themaMono={'배경색': 0xFFE1E1E1, '어플상하단색': 0xFF6E6E6E,
  '어플상하단글씨':0xFFFFFFFF, '아이콘':0xFFFFFFFF,
  '달력상단':0xFF000000, '달력요일글씨':0xFF000000,
  'SELECTED':0xFF9D1E14,'선택글씨': 0xFFE1E1E1,'TODAY':0xFF9D1E14,
  '달력일기쓴날':0xFF9D1E14, '달력하단날짜':0xFF000000,
  '상세보기':0xFF000000, '대화창말풍선':0xFF6E6E6E,
  '대화창글씨':0xFFFFFFFF, '버튼글씨':0xFF000000,
  '버튼테두리':0xFF000000, '버튼배경색':0xFFE1E1E1
};
final themaPop={'배경색': 0xFFFCF7D9, '어플상하단색': 0xFFFCE0D9,
  '어플상하단글씨':0xFFED585F, '아이콘':0xFFED585F,
  '달력상단':0xFFED585F, '달력요일글씨':0xFFED585F,
  'SELECTED':0xFFDCF5F7,'선택글씨':0xFF53B9D8,'TODAY':0xFF53B9D8,
  '달력일기쓴날':0xFF58DEED, '달력하단날짜':0xFFED585F,
  '상세보기':0xFFED585F, '대화창말풍선':0xFFFCE0D9,
  '대화창글씨':0xFFED585F, '버튼글씨':0xFFED585F,
  '버튼테두리':0xFFFCE0D9, '버튼배경색':0xFFFCF7D9
};
final themaColorList = <String,Map>{
  '카페':themaCafe,
  '산토리니':themaSantorini,
  '레트로':themaRetro,
  '모노톤':themaMono,
  '파스텔 팝':themaPop
};

// final List colorList = [
//
//   ['#FFFDF2','#D1BEA5','#7A3815','#4C3825'],
//   ['#FFFDF2','#FFDB0A','#537C24','#7A3815'],
//   ['#FFFFFF','#B6C7F2','#597CD0'],
//   ['#E1E1E1','#6E6E6E','#9D1E14','#000000'],
//   ['#FCF7D9','#FCE0D9','#DCF5F7','#361E10','#ED585F','#58DEED']
// ] ;

