import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:predictionbet/confirm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trained Bets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TODAY'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context,
              new MaterialPageRoute(builder: (BuildContext context) => new ConfirmApp()));
        },
        child: Container(
          width: 1000,
          padding: EdgeInsets.fromLTRB(30, 200, 30, 0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1,0.9],
              colors: [
                Colors.indigo[800],
                Colors.indigo[200],
              ],
            )
          ),
          child:Column(
            children: <Widget>[
              Text("Trained Bets",
                  style:TextStyle(
                      fontSize: 41,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF03d7da),
                      fontFamily: "LCALLIG"
                  )),
              Container(
                margin: EdgeInsets.only(top: 30),
              ),
              Image.asset("assets/images/bet.png", width: 150, height: 150,)
            ],
          ),
        ),
      )
    );
  }
}
