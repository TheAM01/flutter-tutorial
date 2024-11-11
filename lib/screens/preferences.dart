import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => PreferencesScreenState();
}

class PreferencesScreenState extends State<PreferencesScreen> {

  bool? _listensToMusic;

  @override
  void initState() {
    super.initState();
    _loadPreference();
  }

  Future<void> _loadPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _listensToMusic = prefs.getBool("listens_to_music");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Shit app - Preferences"),
      ),
      body: Center(
        child: Text("Do you listen to music? $_listensToMusic"),
      ),
    );
  }
}


