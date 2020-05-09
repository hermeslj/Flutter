import 'package:flutter/material.dart';

void main() => runApp(AboutUs());

class AboutUs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("About Us", style: TextStyle(fontFamily: "COOPBL", fontSize: 28),),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("About Us", style: TextStyle(fontSize: 25, fontFamily: "COOPBL", color: Colors.black),),
            Text("We are ready for you all the time!!!", style: TextStyle(fontSize: 20, color: Colors.black),)
          ],
        ),
      ),
    );
  }
}