import 'package:flutter/material.dart';
import 'package:predictionbet/confirm.dart';

class MainTips extends StatefulWidget{
  final String strUrl;
  final String strTitle;
  final bool binApp;
  MainTips({Key key, this.strUrl, this.strTitle, this.binApp}) : super(key: key);
  _MainTips createState() => _MainTips();
}

class _MainTips extends State<MainTips>{
  String strUrl = "";
  bool binApp ;

  @override
  void initState() {
    // TODO: implement initState
    strUrl = widget.strUrl;
    binApp = widget.binApp;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.strTitle, style: TextStyle(fontSize: 28, fontFamily: "COOPBL"),),
      ),
      bottomNavigationBar: Container(
      height: 40,
//        color: Colors.black12,
      child: InkWell(
        onTap: () => Navigator.pop( context ),
        child: Padding(
          padding: EdgeInsets.only(top: 6.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.home,
                color: Colors.grey,
              ),
//              Text('Home')
            ],
          ),
        ),
      ),
    ),
      body: Container(
        margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
        child: Text(strUrl),
      ),
    );
  }
}