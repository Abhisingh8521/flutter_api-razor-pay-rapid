import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services.dart';

class ValidatePincodeDialog extends StatefulWidget {
  const ValidatePincodeDialog({Key? key}) : super(key: key);

  @override
  State<ValidatePincodeDialog> createState() => _ValidatePincodeDialogState();
}

class _ValidatePincodeDialogState extends State<ValidatePincodeDialog> {
  late bool res;
  TextEditingController pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("pin code",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
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
              res = await ApiServices.isValidatePincode(
                  pinCode: pinCodeController.text);
              if (res) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Yes, it's valid")));
                setState(() {
                  pinCodeController.clear();
                });
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("No, it's not valid")));
                Navigator.pop(context);
              }
            },
          ),

        ],
      ),
    );
  }
}
