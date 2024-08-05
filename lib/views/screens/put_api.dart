import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditPostScreen extends StatefulWidget {
  final int postId;
  final String initialTitle;
  final String initialBody;


  EditPostScreen({
    required this.postId,
    required this.initialTitle,
    required this.initialBody,
  });

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  late TextEditingController _titleController;
  late TextEditingController _bodyController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle);
    _bodyController = TextEditingController(text: widget.initialBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _updatePost(context),
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updatePost(BuildContext context) async {
    final response = await http.patch(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/${widget.postId}'),
      body: {
        'title': _titleController.text,
        'body': _bodyController.text,
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Post Patch successfully'),
        ),
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update post'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }
}
