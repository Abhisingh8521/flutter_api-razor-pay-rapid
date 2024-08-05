import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api/views/screens/patch_api.dart';
import 'package:flutter_api/views/screens/post_api.dart';
import 'package:http/http.dart' as http;
import '../../model/api_model.dart';
import 'put_api.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> deleteData(int id) async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
    final response = await http.delete(uri);

    if (response.statusCode == 200 || response.statusCode == 204) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Post deleted successfully'),
        ),
      );
      setState(() {

      });

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete post'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PostApiScreen()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Post API'),
      ),
      body: FutureBuilder<List<ApiModel>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          var users = snapshot.data;
          return Scrollbar(
            trackVisibility: true,
            child: ListView.builder(
              itemCount: users?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                        maxLines: 1,
                        users?[index].title ?? ""
                    ),
                    subtitle: Text(
                        maxLines: 1,
                        users?[index].body ?? ""
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete,color: Colors.red,),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Delete Post'),
                                content: Text('Are you sure you want to delete this post?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      deleteData( users![index].id!);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.update),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditApiScreen(apiModel: users![index]),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () async {
                            final updated = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPostScreen(
                                  postId: users![index].id!,
                                  initialTitle: users![index].title!,
                                  initialBody: users![index].body!,
                                ),
                              ),
                            );
                            if (updated == true) {
                              setState(() {});
                            }
                          },
                        ),

                      ],
                    ),
                  ),
                );

              },
            ),
          );
        },
      ),
    );
  }

  Future<List<ApiModel>> fetchUsers() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      dynamic bodyData = jsonDecode(response.body);
      if (bodyData is List) {
        return bodyData.map((userJson) => ApiModel.fromJson(userJson)).toList();
      } else {
        return [ApiModel.fromJson(bodyData)];
      }
    } else {
      throw Exception("Invalid body data");
    }
  }
}
