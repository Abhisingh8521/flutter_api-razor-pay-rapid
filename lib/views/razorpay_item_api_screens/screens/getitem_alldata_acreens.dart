import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controller/item_api_contller.dart';


class GetItemsScreen extends StatefulWidget {
  const GetItemsScreen({super.key});

  @override
  State<GetItemsScreen> createState() => _GetItemsScreenState();
}

class _GetItemsScreenState extends State<GetItemsScreen> {
  final ItemsApiController _itemsApiController = ItemsApiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Get Items Data"),
      ),
      body: FutureBuilder(
        future: _itemsApiController.getItemsData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.hasError}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.items!.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.items![index];
              return Column(
                children: [
                  Text(data.id.toString(),style: TextStyle(color: Colors.blue,fontSize: 10),),
                  Text(data.name.toString(),style: TextStyle(color: Colors.blue,fontSize: 10)),
                  Text(data.description.toString(),style: TextStyle(color: Colors.blue,fontSize: 10)),
                  Text(data.amount.toString(),style: TextStyle(color: Colors.blue,fontSize: 10)),
                  Text(data.currency.toString(),style: TextStyle(color: Colors.blue,fontSize: 10)),
                ],
              );
            },
          );
        },
      ),
    );
  }
}