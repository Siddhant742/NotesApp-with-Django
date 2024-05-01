import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Notes'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Note> notes = [];
  Client client = http.Client();
  final Uri linkUrl = Uri.parse("https://siddhant742.pythonanywhere.com/notes/");

  @override
  void initState() {
    _retrieveNotes();
    super.initState();
  }

  void _retrieveNotes() async {
    notes = [];
    List response = jsonDecode( (await client.get(linkUrl)).body);
    final List<dynamic> data = jsonDecode(response.body);u
    response.forEach((element) {
      notes.add(Note.fromMap(element));
    });
    setState(() {
      notes = data.map((element) => Note.fromMap(element)).toList();
    });
  }

  void _deleteNote(int id) {
    client.delete(deleteUrl())
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: RefreshIndicator(

        onRefresh: () async {
          _retrieveNotes();
        },
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(notes[index].note),
              onTap: (){},
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
