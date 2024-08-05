import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services.dart';

class StateofaPincodeScreen extends StatefulWidget {
  const StateofaPincodeScreen({Key? key}) : super(key: key);

  @override
  State<StateofaPincodeScreen> createState() => _StateofaPincodeScreenState();
}

class _StateofaPincodeScreenState extends State<StateofaPincodeScreen> {
  String? state;
  TextEditingController pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("data"),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Enter pin-code'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text("Submit"),
            onPressed: () async {
              state = await ApiServices.getStateofaPincode(
                  pinCode: pinCodeController.text);
              state = "State : $state\nPin-code : ${pinCodeController.text}";
              setState(() {
                pinCodeController.clear();
              });
            },
          ),
          SizedBox(
            height: 50,
          ),
          Text(state == null ? "Pin-Code" : state ?? ""),

        ],
      ),
    );
  }
}
