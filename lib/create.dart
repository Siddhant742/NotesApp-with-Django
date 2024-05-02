import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'urls.dart';

class CreatePage extends StatefulWidget {
  Client client = Client();
  CreatePage({super.key, required this.client});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Note'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            maxLines: 10,
          ),
          ElevatedButton(
              onPressed: () {widget.client.post(URLs.create, body: {'body' : controller.text});
                Navigator.pop(context);},
              child: Text('Create Note'))
        ],
      ),
    );}
}

