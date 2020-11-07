import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Settings extends StatelessWidget {
// Counstructs a drawer to display the settings menu
@override
Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
      iconTheme: IconThemeData(
        color: Color(0xFF232c32),
      ),
      backgroundColor: Color(0xFF5F7D8A),
      title: Text("Settings",
        style: TextStyle(color: Color(0xFF232c32),
            fontSize: 40.0),),
    ),
    body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        ListTile(
          title: Text("Account"),
          onTap: () {
            showDialog(context: context, builder: (_) => AlertDialog(
                                                         title: Text('Account info'),
                                                         content: Text('Username: ' + 'John Doe'),
                                                         ),
            barrierDismissible: true,
            );
          },
        ),
      ],
    ),
  );
}
}