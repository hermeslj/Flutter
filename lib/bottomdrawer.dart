import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BottomNavigationBar(
      currentIndex: 0,
      //onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home")
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Tips")
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text("Store")
        ),
      ],
    );
  }
}