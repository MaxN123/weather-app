import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'posting_board.dart';
import 'saved_locations.dart';
import 'weatherPage.dart';
import 'settings.dart';
// Icons by Erik Flowers, source: https://pub.dev/packages/weather_icons
import 'package:weather_icons/weather_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Application root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weather_app',
      home: Scaffold(
        body: Container(
          child: LoginScreen(),
        ),
      ),
    );
  }
}

Container CreateBackground(String fileName){
  return Container(
    constraints: BoxConstraints.expand(),
    child: Image.asset(fileName,
      fit: BoxFit.cover,),
  );
}

class MainPage extends StatelessWidget {
  // This sets the inital page for the horizontal scroll to the center screen
  @override
  PageController _controller = PageController(
    initialPage: 1,
  );
  // The Pageview object that organizes the horizontal scroll
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CreateBackground('assets/images/mountain.jpg'),
        PageView(
          controller: _controller,
            children: [
              LocationsList(),
              CurrentWeatherPage(),
              PostingBoard(),
      ],
        ),
    ]
    );
  }
}


// creates the main weather page for the homescreen that also has a settings button
class CurrentWeatherPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20.0) ,
        child: Stack(
          children: <Widget> [
            WeatherData(BoxedIcon(WeatherIcons.day_sunny, color: Color(0xFF232c32), size: 80.0,),
            '666', 'FIRE WARNING','October 31','Kalamazoo, MI'),
           // This row is to align the settings button to the left
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 35.0,),
                child: Material(
                  type: MaterialType.transparency,
                  // This is the settings button
                  child: IconButton(
                    icon: Icon(Icons.subject,
                      color: Color(0xFF232c32),
                      size: 80.0,
                    ),
                    tooltip: 'Open Settings',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    },
                  ),
                ),
              ),
            ]
        ),
      ],
    ),
    );
  }
}