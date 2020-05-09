import 'package:flutter/material.dart';
import 'package:predictionbet/about.dart';

class NavDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 50, 10, 20),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black),
                    image: DecorationImage(image: new AssetImage("assets/images/avatar.png"))
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                ),
                Text('Trained Bets', style:
                  TextStyle(
                    fontSize: 25,
                    fontFamily: "LCALLIG",
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    height: 0,

                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.black54,),
          new ListTile(
            title: Text("Home", style: TextStyle(fontSize: 16),),
            leading: Icon(Icons.home),
            onTap: (){},
          ),
          new ListTile(
            title: Text("Terms and conds", style: TextStyle(fontSize: 16),),
            leading: Icon(Icons.settings),
            onTap: (){},
          ),
          new ListTile(
            title: Text("Disclaimer", style: TextStyle(fontSize: 16),),
            leading: Icon(Icons.warning),
            onTap: (){},
          ),
          new ListTile(
            title: Text("Contact us", style: TextStyle(fontSize: 16),),
            leading: Icon(Icons.contacts),
            onTap: (){},
          ),
          new ListTile(
            title: Text("About us", style: TextStyle(fontSize: 16),),
            leading: Icon(Icons.info),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context, MaterialPageRoute(builder:(context) => AboutUs())
              );
            },
          )
        ],
      )
    );
  }
}