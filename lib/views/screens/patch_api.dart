import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/api_model.dart';

class EditApiScreen extends StatefulWidget {
  final ApiModel apiModel;

  EditApiScreen({required this.apiModel});

  @override
  _EditApiScreenState createState() => _EditApiScreenState();
}

class _EditApiScreenState extends State<EditApiScreen> {
  late TextEditingController titleController;
  late TextEditingController bodyController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.apiModel.title);
    bodyController = TextEditingController(text: widget.apiModel.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Patch Api '),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                  updateData(context, widget.apiModel.id!, titleController.text, bodyController.text);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateData(BuildContext context, int id, String title, String body) async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
    final response = await http.patch(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'body': body,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Post updated successfully'),
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update post'),
        ),
      );
    }
  }
}