import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DistanceBetweenTwoPinCode extends StatefulWidget {
  const DistanceBetweenTwoPinCode({Key? key}) : super(key: key);

  @override
  State<DistanceBetweenTwoPinCode> createState() => _DistanceBetweenTwoPinCodeState();
}

class _DistanceBetweenTwoPinCodeState extends State<DistanceBetweenTwoPinCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("DistanceBetweenTwoPinCode"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _calculateDistance,
              child: Text("Submit"),
            ),
          )
        ],
      ),
    );
  }

  void _calculateDistance() async {
    try {
      var res = await http.post(
        Uri.parse("https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/pincode/distance"),
        body: {
          "pincode1": "600001",
          "pincode2": "600075",
        },
        headers: {
          'content-type': 'application/x-www-form-urlencoded',
          'X-RapidAPI-Key': '459218932bmsh0385c35e0ed6884p10f117jsncf5795c9ed7a',
          'X-RapidAPI-Host': 'india-pincode-with-latitude-and-longitude.p.rapidapi.com'
        },
      );
      if (res.statusCode == 200) {
        var bodyData = jsonDecode(res.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success $bodyData")));
        print(bodyData);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}