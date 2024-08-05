import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'using_pincode_get_screens.dart';

class PincodeDetails extends StatefulWidget {
  const PincodeDetails({super.key});

  @override
  State<PincodeDetails> createState() => _PincodeDetailsState();
}

class _PincodeDetailsState extends State<PincodeDetails> {
  TextEditingController pincodcon = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add a form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Enter Pincode"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: pincodcon,
                decoration: InputDecoration(
                    labelText: 'Enter Pincode',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Pincode cannot be empty';
                  } else if (value.length != 6) {
                    return 'Pincode must be 6 characters long';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            CupertinoButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UsingPinCodeGetAreas(
                        pinCode: pincodcon.text,
                      ),
                    ),
                  );
                }
              },
              color: Colors.blue,
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
