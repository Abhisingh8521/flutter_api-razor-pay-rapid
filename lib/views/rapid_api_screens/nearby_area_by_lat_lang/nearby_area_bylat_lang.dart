import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NearByAreasBylatLang extends StatefulWidget {
  const NearByAreasBylatLang({Key? key}) : super(key: key);

  @override
  State<NearByAreasBylatLang> createState() => _NearByAreasBylatLangState();
}

class _NearByAreasBylatLangState extends State<NearByAreasBylatLang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("NearByAreasBylatLang"),),
      body: Center(
        child: ElevatedButton(
          onPressed: _fetchNearbyAreas,
          child: Text("Submit"),
        ),
      ),
    );
  }

  Future<void> _fetchNearbyAreas() async {
    try {
      final response = await http.post(
        Uri.parse("https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/pincode/nearby"),
        headers: {
          'X-RapidAPI-Key': '459218932bmsh0385c35e0ed6884p10f117jsncf5795c9ed7a',
          'X-RapidAPI-Host': 'india-pincode-with-latitude-and-longitude.p.rapidapi.com'
        },
      );

      if (response.statusCode == 200) {
        final bodyData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Success: $bodyData"),
            duration: Duration(seconds: 5),
          ),
        );
        print(bodyData);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: Failed to load data"),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}