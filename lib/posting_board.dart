import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';


class PostingBoard extends StatelessWidget {
  // Variable to store the Posting List in
  List<PostData> post = [
    PostData(BoxedIcon(WeatherIcons.day_sunny_overcast, color: Color(0xFF232c32), size: 60.0,), 'Jam', 'overcast'),
    PostData(BoxedIcon(WeatherIcons.rain_wind, color: Color(0xFF232c32), size: 60.0,), 'Jem', 'raining'),
  ];
  @override
  // Creates the PostingBoard Page
  Widget build(BuildContext context) {
    return PostList(post);
  }
}

class PostList extends StatefulWidget {
  // Stores the Posting Board List
  final List<PostData> post;
  const PostList(this.post);

  @override
  _PostList createState() => _PostList();
}

class _PostList extends State<PostList> {
  // Creates a ListView presentation of all the posts stored in the PostList list
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 15.0),
            child: Container(
              child: new ListView.builder(
                itemBuilder: (_, int index) => widget.post[index],
                itemCount: widget.post.length,
              ),
            ),
          ),
          // Places the new post button in the bottom right
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              // Button that allows another post to be added to the list
              child: FloatingActionButton(
                onPressed: () {
                  _awaitReturnValueFromSecondScreen(context);
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
        ]
    );
  }

  //Calls the add post constructor, waits to receive data from it and then adds that to the list
  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    //source: https://stackoverflow.com/questions/53861302/passing-data-between-screens-in-flutter
    // stores the received info from the AddPost call into a variable
    String result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddPost(),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    if (result != null) {
      setState(() {
        widget.post.add(PostData(
            BoxedIcon(WeatherIcons.rain, color: Color(0xFF232c32), size: 60.0,), 'Jam',
            result));
      });
    }
  }
}

class PostData extends StatefulWidget {
  // Stores data for an individual post in the posting board.
  final BoxedIcon symbol;
  final String username;
  final String weather;
  const PostData(this.symbol,this.username, this.weather);

  @override
  Post createState() => Post();
}

class Post extends State<PostData>{
  // Constructs an individual post
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(padding: EdgeInsets.only(bottom: 25.0),
            child: Container(
                width: 370.0,
                height: 110.0,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                // Lines up the icon and text in a row.
                child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: widget.symbol,
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: Text(
                        widget.username + ' said that it is \ncurrently ' + widget.weather + '\nat your location.',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF232c32)
                        ),
                      ),
                    ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0, left: 35.0),
                          child: Column(
                        children: <Widget> [
                            Material(
                              borderRadius: new BorderRadius.only(),
                              type: MaterialType.transparency,
                             child: IconButton(
                              icon: Icon(Icons.thumb_up,
                              color: Color(0xFF232c32),
                              size: 30.0,
                            ),
                            tooltip: 'Open Settings',
                            onPressed: () {
                            },
                          ),
                          ),
                           Material(
                            type: MaterialType.transparency,
                            child: IconButton(
                              icon: Icon(Icons.thumb_down,
                              color: Color(0xFF232c32),
                              size: 30.0,
                            ),
                            tooltip: 'Open Settings',
                            onPressed: () {
                            },
                          ),
                          ),
                        ],
                      )
                      ),
                    ]
                )
            )
        )
    );
  }
}

class AddPost extends StatefulWidget {
  // Adds a post to the PostList
  @override
  PostEntry createState() => PostEntry();
}

class PostEntry extends State<AddPost> {
  //source: https://stackoverflow.com/questions/49778217/how-to-create-a-dialog-that-is-able-to-accept-text-input-and-show-result-in-flut
  // &      https://api.flutter.dev/flutter/material/DropdownButton-class.html
  // Initial value to set the dropdown list to
  String dropdownValue = 'Sunny';

  Widget build(BuildContext context) {
    return Material(
        child: Container(
            alignment: Alignment.center,
            child: Container(
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 24),
                  // AddPost title
                  Text(
                    "What is the weather in your area?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF232c32),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
                      child:  DropdownButton<String>(
                        // Value to store chosen object in
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        // Resets chosen object
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        // List of choices
                        items: <String>['Sunny', 'Cloudy', 'Windy', 'Raining']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Cancel Button
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Color(0xFF232c32),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      // Post Button
                      RaisedButton(
                        color: Color(0xFF5F7D8A),
                        child: Text(
                          "Post".toUpperCase(),
                          style: TextStyle(
                            color: Color(0xFF232c32),
                          ),
                        ),
                        onPressed: () {
                          print('Update the user info');
                          Navigator.pop(context, dropdownValue);
                        },
                      )
                    ],
                  ),
                ],
              ),
            )
        )
    );
  }
}
