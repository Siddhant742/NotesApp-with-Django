import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'urls.dart';
import 'note.dart';

class UpdatePage extends StatefulWidget {
  Client client = Client();
  int id;
  String note;
  UpdatePage({super.key, required this.client, required this.id, required this.note});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    initState(){
      controller.text = widget.note;
      super.initState();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Note'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            maxLines: 10,
          ),
          ElevatedButton(
              onPressed: () {widget.client.put(URLs.updateNoteUrl(widget.id), body: {'body' : controller.text});
              Navigator.pop(context);},
              child: Text('Update Note'))
        ],
      ),
    );}
}

