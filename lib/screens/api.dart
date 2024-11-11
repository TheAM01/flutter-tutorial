import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {

  @override
  void initState() {
    super.initState();
    postData();
    getData();
  }

  Future<void> getData() async {

    String razeen = "https://crudcrud.com/api/938d998093e841babfa8fb337d2a679f/users";

    Uri url = Uri.parse(razeen);

    var response = await http.get(url);

    var postData = jsonDecode(response.body);

    print(postData[0]["gender"]);

  }

  Future<void> postData() async {
    String uri = "https://crudcrud.com/api/938d998093e841babfa8fb337d2a679f/users/673272373af7c503e8d5d82d";
    Uri url = Uri.parse(uri);

    final Map user = {
      "id": '420',
      "name": "Razeen",
      "age": '69',
      'gender': 'hybrid'
    };
    final Map ashar = {
      "id": '2',
      "name": "2",
      "age": '3',
      'gender': '4'
    };


    var response = await http.put(url,
      body: jsonEncode(ashar),
      headers: {
        "Content-Type": "application/json",
      },
    );

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Shit app - API"),
      ),
      body: Center(
        child: Text("API DEMO"),
      ),
    );
  }
}