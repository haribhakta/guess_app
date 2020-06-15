import 'package:flutter/material.dart';
import 'controllerimages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        brightness: Brightness.light,
        accentColor: Colors.indigo,
      ),
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text("Guess the following...."),
        ),
        body: GuessApp(),
      ),
    );
  }
}

class GuessApp extends StatefulWidget {
  @override
  _GuessAppState createState() => _GuessAppState();
}

class _GuessAppState extends State<GuessApp> {
  ControllerImage ci = ControllerImage();
  String image;
  int rightanswer = 0;
  int totalimage = 0;
  List<Icon> scorekeeper = [];

  void checkanswer(String response) {
    setState(() {
      if (response == ci.getanswer()) {
        scorekeeper.add(Icon(Icons.check, color: Colors.white));
        rightanswer++;
      } else {
        scorekeeper.add(Icon(Icons.close, color: Colors.red));
      }
      if (ci.isfinished() == true) {
        _showdialog();
        ci.reset();
        scorekeeper.clear();
      } else {
        ci.nextimage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Score:$rightanswer/${ci.gettotalimageno()}",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Expanded(
            flex: 6,
            child: Image.asset(
              "assets/images/${ci.getimagename()}",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 5.0),
          Expanded(
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                checkanswer(ci.getoptions()[0]);
              },
              child: Text(
                ci.getoptions()[0],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Expanded(
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                checkanswer(ci.getoptions()[1]);
              },
              child: Text(
                ci.getoptions()[1],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Expanded(
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                checkanswer(ci.getoptions()[2]);
              },
              child: Text(
                ci.getoptions()[2],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Expanded(
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                checkanswer(ci.getoptions()[3]);
              },
              child: Text(
                ci.getoptions()[3],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: scorekeeper,
            ),
          )
        ],
      ),
    );
  }

  void _showdialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("You have completed the task !"),
            content: Text("You have given $rightanswer right answer"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Play Agian"),
              )
            ],
          );
        });
  }
} //end of class
