import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String assetName = 'assets/Group 1791 2.svg';
  final String assetName1 = 'assets/Group 1808.svg';
  final String assetName2 = 'assets/Group 9600.svg';
  final String assetName3 = 'assets/01-home.svg';
  final String assetName4 = 'assets/Group 1810.svg';
  final String assetName5 = 'assets/Group 1811.svg';
  final String assetName6 = 'assets/Group 1812.svg';
  final String assetName7 = 'assets/notification.svg';
  final String assetName8 = 'assets/Group 1813.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366,
      child: 
          Drawer(child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Select Page'),
      ),
      ListTile(
        title: Text('Page 1',style: TextStyle(fontSize: 18),),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
     
      ListTile(
        title: Text('Page 2',style: TextStyle(fontSize: 18)),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ), ListTile(
        title: Text('Page 3',style: TextStyle(fontSize: 18)),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
    ],
  ),) 
          
    );
  }
}
