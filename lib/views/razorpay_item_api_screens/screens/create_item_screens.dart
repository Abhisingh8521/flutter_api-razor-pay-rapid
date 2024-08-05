import 'package:flutter/material.dart';
import 'package:flutter_api/views/razorpay_item_api_screens/utils/razorypay_wiidgets.dart';

import '../../../controller/item_api_contller.dart';
import 'getitem_alldata_acreens.dart';
import 'getitem_by_idscreens.dart';

class CreateItemsScreen extends StatefulWidget {
  const CreateItemsScreen({super.key});

  @override
  State<CreateItemsScreen> createState() => _CreateItemsScreenState();
}

class _CreateItemsScreenState extends State<CreateItemsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final ItemsApiController _itemsApiController = ItemsApiController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var view = AppWidgets();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Add Items"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              view.textFormField(
                  controller: _nameController, hintText: "Enter Name"),
              view.sizedBox(height: screenHeight / 30),
              view.textFormField(
                  controller: _descriptionController,
                  hintText: "Enter Description"),
              view.sizedBox(height: screenHeight / 30),
              view.textFormField(
                  controller: _amountController, hintText: "Enter Amount"),
              view.sizedBox(height: screenHeight / 20),

              MaterialButton(
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                color: Colors.blue,
                height: 50,
                minWidth: 200,
                onPressed: () {

                _itemsApiController.createItems(_nameController.text,
                    _descriptionController.text, _amountController.text);

               // Navigator.push(context, MaterialPageRoute(builder: (context) => GetItemByIdScreen(),));

              },child: const Text("Create",style: TextStyle(color: Colors.white),),
              ),

              view.sizedBox(height: screenHeight / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  view.defaultButton("View Items Data",
                      height: screenHeight / 15,
                      width: screenWidth / 3, onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GetItemsScreen(),
                        ));
                  }, color: Colors.blue),
                  view.defaultButton("View Items Data By Id",
                      height: screenHeight / 15,
                      width: screenWidth / 3, onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GetItemByIdScreen(),
                        ));
                  }, color: Colors.blue)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
