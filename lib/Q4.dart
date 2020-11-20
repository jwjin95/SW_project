import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

//constants
const kPrimaryColor = Color(0xff9ce6ff);
const kBorderColor = Color(0xfff2feff);
const kBackgroundWhiteColor = Color(0xffF8F6F5);

const kAmounts = ["50", "100", "250", "500"];


const kTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
);
//
//RoundButton
class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  const RoundButton({Key key, @required this.icon, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.grey,
        child: Icon(icon),
      ),
    );
  }
}
//

class stf extends StatefulWidget{
  @override
  _StfState createState() =>_StfState();
}
class _StfState extends State<stf>{
  int amount = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "일기 쓰기",
        ),
        elevation:0,
        centerTitle: true,
      ),
      backgroundColor: kPrimaryColor,
      body: _buildBody(),
      bottomNavigationBar: _buildButtonsSection(),
    );
  }
  Widget _buildBody(){
    return Container(
      margin: EdgeInsets.only(top:56),
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(30),
        ),
        color: Colors.white,
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 32,
            ),
            child: Text(
              "오늘 기분의 강도는 어때???",
              textAlign:TextAlign.center,
              style:kTextStyle.copyWith(color: Colors.grey.shade700),
            ),
          ),
          Divider(),
          _buildAmountSection(),
        ],
      ),
    );
  }
  Widget _buildAmountSection(){
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(children:<Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RoundButton(
              onTap: () {
                setState((){
                  amount--;
                });
              },
              icon: Icons.remove,
            ),
            Text(
              "\$ amount",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 42,
              ),
            ),
            RoundButton(
              icon: Icons.add,
              onTap: (){
                setState((){
                  amount++;
                });
              },
            )
          ],
        ),
        Slider(
          value: amount.toDouble(),
          onChanged:(newValue){
            setState((){
              amount=newValue.toInt();
            });
          },
          min:1,
          max:5,
        ),
        Divider(),
      ],
      ),
    );
  }

  Widget _buildButtonsSection() {
    return Container(
      color: kBackgroundWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(onPressed: () {},
                color: Colors.grey.shade300,
                textColor: Colors.grey.shade600,
                child: Text("Cancel",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8,))),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: RaisedButton(onPressed: () {},
                color: kPrimaryColor,
                textColor: Colors.white,
                child: Text("Send",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8,))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
