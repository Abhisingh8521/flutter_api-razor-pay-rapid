import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../controller/item_api_contller.dart';
import 'update_item_screens.dart';

class GetItemByIdScreen extends StatefulWidget {
  const GetItemByIdScreen({Key? key}) : super(key: key);

  @override
  State<GetItemByIdScreen> createState() => _GetItemByIdScreenState();
}

class _GetItemByIdScreenState extends State<GetItemByIdScreen> {
  final ItemsApiController _itemsApiController = ItemsApiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Get Item By Id"),
      ),
      body: FutureBuilder(
        future: _itemsApiController.getItemByIdData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          var data = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text(
                        "ID: ${data!.id}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name: ${data.name}"),
                          Text("Description: ${data.description}"),
                          Text("Amount: ${data.amount}"),
                          Text("Currency: ${data.currency}"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateItemScreen(
                                  data: snapshot.data,
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.update),
                          color: Colors.blue,
                        ),
                        IconButton(
                          onPressed: () {
                            _itemsApiController.deleteItem(data.id.toString());
                            Fluttertoast.showToast(
                                msg: "Item deleted successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
