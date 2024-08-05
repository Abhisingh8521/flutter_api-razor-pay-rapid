import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NearByAreasByPinCode extends StatefulWidget {
  const NearByAreasByPinCode({Key? key}) : super(key: key);

  @override
  State<NearByAreasByPinCode> createState() => _NearByAreasByPinCodeState();
}

class _NearByAreasByPinCodeState extends State<NearByAreasByPinCode> {
  late TextEditingController _pinCodeController;

  bool _isLoading = false;
  String _responseText = '';

  @override
  void initState() {
    super.initState();
    _pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('NearByAreasByPinCode'),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _pinCodeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter PIN Code',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateDistance,
                child: Text("Submit"),
              ),
              SizedBox(height: 20),
              if (_isLoading)
                CircularProgressIndicator()
              else if (_responseText.isNotEmpty)
                Text(_responseText),
            ],
          ),
        ),
      ),
    );
  }

  void _calculateDistance() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String pinCode = _pinCodeController.text.trim();
      var res = await http.post(
        Uri.parse("https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/pincode/$pinCode/nearby"),
        headers: {
          'X-RapidAPI-Key': '459218932bmsh0385c35e0ed6884p10f117jsncf5795c9ed7a',
          'X-RapidAPI-Host': 'india-pincode-with-latitude-and-longitude.p.rapidapi.com'
        },
      );
      if (res.statusCode == 200) {
        var bodyData = jsonDecode(res.body);
        setState(() {
          _responseText = "Success $bodyData";
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }
}
