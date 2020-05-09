import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:predictionbet/navdrawer.dart';
import 'package:intl/intl.dart';
import 'package:predictionbet/scrape.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';

import 'dart:developer';

class ConfirmApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Trained Bets",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "Trained Bets"),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final String today = DateFormat("MM.dd").format(DateTime.now());
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  var now = new DateTime.now();
  double yestFont = 16;
  double todayFont = 22;
  double tomoFont = 16;
  Color yestColor = Colors.black87;
  Color todayColor = Colors.white;
  Color tomoColor = Colors.black87;
  bool binApp = true;
  bool _inProgress = true;
  bool bFirst = true;
  List<dynamic> listTeam ;
  @override
  void initState()
  {
    super.initState();
    _pushToday();
  }
  void getTips(String strUrl)
  {
    initiate(strUrl)
        .then((values) {
      setState(() {
        _inProgress = false;
        bFirst = false;
        listTeam = values;
      });
    });
  }
  Widget _getRowWidget(int index, List<dynamic> listTeam){
    if( index == 0 && listTeam == null )
    {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/avatar.png",)
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
    if (index == 0 && listTeam != null ){
      if( listTeam.length != 0 )
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("assets/images/avatar.png",)
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Column(
                children: <Widget>[
                  Container(
                    //                        margin : EdgeInsets.only(left: 15),
                    child: Text(listTeam[index]["leag"] + "  " + listTeam[index]["homeTeam"],
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16),),
                  ),
                  Container(
                    //                        margin : EdgeInsets.only(left: 15),
                    child: Text(listTeam[index]["awayTeam"],
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16),),
                  ),
                  Container(
                    //                        margin: EdgeInsets.only(left: 15),
                    child: Text(listTeam[index]["datetime"] + "  " + listTeam[index]["weather"],
                      style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    //                        margin: EdgeInsets.only(left: 15),
                    child: Text("Probability - " + listTeam[index]["probablity"] + "    Prediction - " + listTeam[index]["forebet"],
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 16),),
                  ),
                  Container(
                    //                        margin: EdgeInsets.only(left: 15),
                    child: Text( "AvgGoals - " + listTeam[index]["avggoals"] + "   Odds - " + listTeam[index]["odds"],
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigoAccent, fontSize: 16),),
                  )
                ],
              ),
            ),
          ],
        );
      else
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("assets/images/avatar.png",)
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
    }else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Icon(Icons.lock, size: 30, ),
          ),
        ],
      );
    }
  }

  void _pushYesterday()
  {
    if( _inProgress ) return;
    _inProgress = true;
    setState(() {
      getTips( "https://www.forebet.com/en/football-predictions-from-yesterday");
      yestFont = 22;
      todayFont = 16;
      tomoFont = 16;
      yestColor = Colors.white;
      todayColor = Colors.black87;
      tomoColor = Colors.black87;
    });
  }
  void _pushToday()
  {
    if( _inProgress && !bFirst ) return;
    _inProgress = true;
    setState(() {
      getTips( "https://www.forebet.com/en/football-tips-and-predictions-for-today");
      todayFont = 22;
      yestFont = 16;
      tomoFont = 16;
      yestColor = Colors.black87;
      todayColor = Colors.white;
      tomoColor = Colors.black87;
    });
  }
  void _pushTomorrow()
  {
    if( _inProgress ) return;
    _inProgress = true;
    setState(() {
      getTips( "https://www.forebet.com/en/football-tips-and-predictions-for-tomorrow");
      todayFont = 16;
      yestFont = 16;
      tomoFont = 22;
      yestColor = Colors.black87;
      todayColor = Colors.black87;
      tomoColor = Colors.white;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10.0,
        titleSpacing: 0.00,
        title: Text(widget.title, style: TextStyle(fontSize: 28, fontFamily: "COOPBL"),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              height: 50.0,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    child: Text("Yesterday",
                      style: TextStyle(fontSize: yestFont, fontFamily: "COOPBL", color: yestColor),textAlign: TextAlign.left,),
                    onTap: (){
                      _pushYesterday();
                    },
                  ),
                  SizedBox( width: 10,),
                  GestureDetector(
                    child: Text(widget.today,
                      style: TextStyle(fontSize: todayFont, fontFamily: "COOPBL", color: todayColor), textAlign: TextAlign.center,),
                    onTap:(){
                      _pushToday();
                    },
                  ),
                  SizedBox( width: 10,),
                  GestureDetector(
                    child: Text("Tomorrow",
                      style: TextStyle(fontSize: tomoFont, fontFamily: "COOPBL", color: tomoColor), textAlign: TextAlign.right,),
                    onTap: (){
                      _pushTomorrow();
                    },
                  ),
                ],
              )

            ),
          ),
        ),
      ),
      drawer: NavDrawer(),
      bottomNavigationBar: Container(
        height: 40,
//        color: Colors.black12,
        child: InkWell(
          onTap: () { _pushToday(); },
          child: Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.home,
                  color: Theme.of(context).accentColor,
                ),
//                Text('Home')
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            //child: preView
            child: binApp ? ModalProgressHUD(
              inAsyncCall: _inProgress,
              child: ListView.builder(
                itemCount: listTeam != null ? listTeam.length : 0,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(top:10),
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10) ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(color: Colors.grey, offset: Offset(0, 5), blurRadius: 7, spreadRadius: 0),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: AssetImage("assets/images/avatar.png",)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
//                alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Container(
//                        margin : EdgeInsets.only(left: 15),
                                  child: Text(listTeam[index]["leag"] + "  " + listTeam[index]["homeTeam"],
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16),),
                                ),
                                Container(
//                        margin : EdgeInsets.only(left: 15),
                                  child: Text(listTeam[index]["awayTeam"],
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16),),
                                ),
                                Container(
//                        margin: EdgeInsets.only(left: 15),
                                  child: Text(listTeam[index]["datetime"] + "  " + listTeam[index]["weather"],
                                    style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Container(
//                        margin: EdgeInsets.only(left: 15),
                                  child: Text("Probability - " + listTeam[index]["probablity"] + "    Prediction - " + listTeam[index]["forebet"],
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 16),),
                                ),
                                Container(
//                        margin: EdgeInsets.only(left: 15),
                                  child: Text( "AvgGoals - " + listTeam[index]["avggoals"] + "   Odds - " + listTeam[index]["odds"],
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigoAccent, fontSize: 16),),
                                )
                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  );
                },
              ),
            ) :
            ModalProgressHUD(
              inAsyncCall: _inProgress,
              child: ListView.builder(
                itemCount: 4,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(top:10),
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10) ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(color: Colors.grey, offset: Offset(0, 5), blurRadius: 7, spreadRadius: 0),
                      ],
                    ),
                    child: _getRowWidget(index, listTeam),
                  );
                },
              ),
            ),
          )
        ],
      )
    );
  }
}