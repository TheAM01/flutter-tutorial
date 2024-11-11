import 'package:flutter/material.dart';

import 'music.dart';
import 'row_demo.dart';
import 'preferences.dart';
import 'api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Shit app"),
      ),
      body: Column(
        children: [
          Text("Introduction:"),
          Text(
            "This is an app I made for teaching flutter which is a very garbage language.",
          ),
          Text("Made by:"),
          Text("Mueed"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RowDemo()));
            },
            child: Text("Row Demo"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MusicScreen()));
            },
            child: Text("Music Panel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PreferencesScreen()));
            },
            child: Text("Preferences"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ApiScreen()));
            },
            child: Text("API"),
          ),
        ],
      ),
    );
  }
}
