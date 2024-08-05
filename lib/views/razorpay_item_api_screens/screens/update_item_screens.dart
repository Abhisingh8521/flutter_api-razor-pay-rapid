import 'package:flutter/material.dart';
import 'package:flutter_api/controller/item_api_contller.dart';
import 'package:flutter_api/model/razorpay_item_model/get_item_byid_model.dart';

import '../utils/razorypay_wiidgets.dart';


class UpdateItemScreen extends StatefulWidget {
  GetItemByIdModel? data;
  UpdateItemScreen({super.key, this.data});

  @override
  State<UpdateItemScreen> createState() => _UpdateItemScreenState();
}

class _UpdateItemScreenState extends State<UpdateItemScreen> {
  final TextEditingController _updateNameController = TextEditingController();
  final TextEditingController _updateDescriptionController = TextEditingController();
  final TextEditingController _updateAmountController = TextEditingController();
  final ItemsApiController _itemsApiController = ItemsApiController();
  @override
  void initState() {
    _updateNameController.text = widget.data!.name.toString();
    _updateDescriptionController.text = widget.data!.description.toString();
    _updateAmountController.text = widget.data!.amount.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var view = AppWidgets();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Update Items"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              view.textFormField(controller: _updateNameController, hintText: "Enter Name"),
              view.sizedBox(height: screenHeight/30),
              view.textFormField(controller: _updateDescriptionController, hintText: "Enter Description"),
              view.sizedBox(height: screenHeight/30),
              view.textFormField(controller: _updateAmountController, hintText: "Enter Amount"),
              view.sizedBox(height: screenHeight/20),
              view.elevatedButton("Update Item", onPressed: (){
                _itemsApiController.updateItem(_updateNameController.text, _updateDescriptionController.text, _updateAmountController.text);
                Navigator.pop(context);
              }),
              view.sizedBox(height: screenHeight/20),
            ],
          ),
        ),
      ),
    );
  }
}