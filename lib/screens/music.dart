import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final List<Map> favoriteMusic = [
    {"name": "Jhol", "artist": "Maanu, Annural Khalid"},
    {"name": "Iraaday", "artist": "Abdul Hannan"}
  ];

  Future<void> _savePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("listens_to_music", true);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _savePreference();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController musicName = TextEditingController();
    final TextEditingController artistName = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Shit app - Music Panel"),
      ),
      body: ListView.builder(
          itemCount: favoriteMusic.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.music_note_rounded),
              title: Text(favoriteMusic[index]["name"]),
              subtitle: Text(favoriteMusic[index]["artist"]),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    favoriteMusic.removeAt(index);
                  });
                },
                icon: const Icon(Icons.delete)
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add new music"),
                icon: const Icon(Icons.music_note_rounded),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: musicName,
                      decoration: const InputDecoration(
                        label: Text("Music name"),
                      ),
                    ),
                    TextField(
                      controller: artistName,
                      decoration: const InputDecoration(
                        label: Text("Artist name"),
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () {

                        if ((musicName.text.trim()) == "" || artistName.text.trim() == "") {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                icon: Icon(Icons.error),
                                title: const Text("Error"),
                                content: const Text("Song name or artist name is empty."),
                                actions: [
                                  TextButton(onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("OK"))
                                ],
                              );
                            }
                          );
                        } else {
                          setState(() {
                            favoriteMusic.add({
                              "name": musicName.text,
                              "artist": artistName.text,
                            });
                          });
                          Navigator.of(context).pop();
                        }

                      },
                      child: const Text("Add")),
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
