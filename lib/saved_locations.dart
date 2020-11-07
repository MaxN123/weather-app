import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'weatherPage.dart';
import 'main.dart';
import 'package:weather_icons/weather_icons.dart';

class LocationData extends StatefulWidget{
  // Constructor to store Location state data
  final BoxedIcon weatherSymbol;
  final String temp;
  final String XType;
  final String date;
  final String location;
  const LocationData(this.weatherSymbol,this.temp, this.XType, this.date, this.location);

  @override
  SavedLocation createState() => SavedLocation();
}

class SavedLocation extends State<LocationData> {
  // Creates a button using passed LocationData to create a weather page.
  @override
  Widget build(BuildContext context) {
    {
      return Align(
          child: Padding (
              padding: EdgeInsets.only(bottom: 25.0),
              child: MaterialButton(
                  textColor: Color(0xFF232c32),
//                  padding: EdgeInsets.all(40.40),
                  shape: StadiumBorder(),
                  onPressed: () {
// Calls a weather page
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>
                          Stack(
                            children: [
                              CreateBackground('assets/images/mountain.jpg'),
                              WeatherData(
                                  widget.weatherSymbol, widget.temp, widget.XType,
                                  widget.date, widget.location),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(right: 35.0,),
                                      child: Material(
                                        type: MaterialType.transparency,
                                        // This is the settings button
                                        child: IconButton(
                                          icon: Icon(Icons.arrow_back,
                                            color: Color(0xFF232c32),
                                            size: 80.0,
                                          ),
                                          tooltip: 'Open Settings',
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ],
                          )
                          ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/cloud.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100.0, top: 74.0, right: 100.0, bottom: 60.0),
                      child: Text(widget.location, style: TextStyle(fontSize: 20.0)),
                    ),
                  )
              )
          )
      );
    }
  }
}

class LocationsList extends StatelessWidget {
  // List of saved Loctions
  List<LocationData> Locations = [
    LocationData(BoxedIcon(WeatherIcons.snow_wind, color: Color(0xFF232c32), size: 80.0,), '1', 'Wind Chill','October 31','Kalamazoo, MI'),
    LocationData(BoxedIcon(WeatherIcons.day_sunny_overcast, color: Color(0xFF232c32), size: 80.0,), '50', ' ','October 31','Los Angeles, CA'),
  ];

  // Creates a list to display the locations
  @override
  Widget build(BuildContext context) {
    return Container(
            child: new ListView.builder(
              itemBuilder: (_, int index) =>
              this.Locations[index],
              itemCount: Locations.length,
            ),
    );
  }
}
