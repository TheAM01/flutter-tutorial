import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {
  const RowDemo({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Shit app - Row Demonstration"),
      ),
      body: Column(
        
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.tealAccent,
                  child: Text("Item: $index"),
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.all(10),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                
                return ListTile(
                  leading: Icon(Icons.book),
                  title: Text("Item number: ${index+1}"),
                  subtitle: Text("User number: ${index+1}"),
                  trailing: Icon(Icons.delete),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}