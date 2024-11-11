import 'package:flutter/material.dart';

import 'music.dart';
import 'row_demo.dart';

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
            child: Text("Navigate to next screen."),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MusicScreen()));
            },
            child: Text("Navigate to music panel."),
          ),
        ],
      ),
    );
  }
}
