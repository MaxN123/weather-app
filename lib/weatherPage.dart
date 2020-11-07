import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherData extends StatefulWidget {
  // Stores weather info for a weather page
  final BoxedIcon weatherSymbol;
  final String temp;
  final String XType;
  final String date;
  final String location;
  const WeatherData(this.weatherSymbol,this.temp, this.XType, this.date, this.location);

  @override
  WeatherPage createState() => WeatherPage();
}


class WeatherPage extends State<WeatherData> {
  // Constructs a page to display a location's weather information
  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // This column aligns the container that stores the rest of the information
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // This container stores the remaining widgets on screen. It's purpose is for
                      // aligning them.
                      Material(
                        type: MaterialType.transparency,
                        child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                          child: Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Column(
                              children: <Widget> [
                                // This container stores the weather symbol and the Temperature
                                Container(
                                  child: widget.weatherSymbol,
                                ),
                                Text(
                                    widget.temp + '°F',
                                    style: TextStyle(
                                      fontSize: 70,
                                      color: Color(0xFF232c32),
                                    )
                                ),
                                // This container displays the weather warning, date & location
                                Container(
                                    child: Text(
                                        '\n\n' + widget.XType,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xFF232c32),
                                        )
                                    )
                                ),

                                Text(
                                    '\n\n' + widget.date,
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: Color(0xFF232c32),
                                    )
                                ),
                                Text(
                                    widget.location,
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: Color(0xFF232c32),
                                    )
                                ),
                              ]
                          ),
                        ),
                      ),
                     ),
                    ]
                ),
              ]
    );
  }
}