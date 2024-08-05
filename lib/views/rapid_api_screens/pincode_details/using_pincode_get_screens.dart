import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../model/pincode_model.dart';
import '../services.dart';

class UsingPinCodeGetAreas extends StatefulWidget {
  final String pinCode;
  UsingPinCodeGetAreas({Key? key, required this.pinCode}) : super(key: key);

  @override
  State<UsingPinCodeGetAreas> createState() => _UsingPinCodeGetAreasState();
}

class _UsingPinCodeGetAreasState extends State<UsingPinCodeGetAreas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Get pincode get your area name'),
      ),
      body: Center(
        child: FutureBuilder<List<PinCodeModel>>(
          future: ApiServices.getPincodeDetails(pinCode: widget.pinCode),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final data = snapshot.data![index];
                  return ListTile(
                    leading: Text("${index+1}"),
                    title: Text('Area Name: ${data.area}'),
                    subtitle: Text('Pin-code: ${data.pincode}'),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}