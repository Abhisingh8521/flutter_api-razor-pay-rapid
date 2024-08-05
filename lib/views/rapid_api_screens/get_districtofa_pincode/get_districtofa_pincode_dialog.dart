import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services.dart';

class DistrictofaPincode extends StatefulWidget {
  const DistrictofaPincode({Key? key}) : super(key: key);

  @override
  State<DistrictofaPincode> createState() => _DistrictofaPincodeState();
}

class _DistrictofaPincodeState extends State<DistrictofaPincode> {
  String? district;
  TextEditingController pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("DistrictofaPincode", style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pinCodeController,
              decoration: InputDecoration(
                  hintText: 'Enter pin-code',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text("Submit"),
            onPressed: () async {
              district = await ApiServices.getDistrictofaPincode(
                  pinCode: pinCodeController.text);
              if (district == null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("It's not a valid pin-code")));
              } else {
                setState(() {
                  district = "District: $district\nPin-code: ${pinCodeController.text}";
                });
              }
            },
          ),
          Text(district ?? "Pin-Code"),
        ],
      ),
    );
  }
}