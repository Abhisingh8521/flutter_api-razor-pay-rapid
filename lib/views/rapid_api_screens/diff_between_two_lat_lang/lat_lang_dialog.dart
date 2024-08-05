import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../services.dart';

class DifferenceBetweenTwoLatLang extends StatefulWidget {
  const DifferenceBetweenTwoLatLang({Key? key}) : super(key: key);

  @override
  State<DifferenceBetweenTwoLatLang> createState() => _DifferenceBetweenTwoLatLangState();
}

class _DifferenceBetweenTwoLatLangState extends State<DifferenceBetweenTwoLatLang> {
  TextEditingController lat1Controller = TextEditingController();
  TextEditingController lat2Controller = TextEditingController();
  TextEditingController lag1Controller = TextEditingController();
  TextEditingController lag2Controller  = TextEditingController();
  String _selectedUnit = 'optional unit';
  String? distance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("DifferenceBetweenTwoLatLang"),),
      body:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(distance == null ? "DistanceBetweenTwoLat,Lng" : distance??"Something went wrong"),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: TextFormField(
              controller: lat1Controller,
              decoration: InputDecoration(hintText: 'lat1'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: lag1Controller,
              decoration: InputDecoration(hintText: 'lag1'),
            ),
          ),SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: lat2Controller,
              decoration: InputDecoration(hintText: 'lat2'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: lag2Controller,
              decoration: InputDecoration(hintText: 'lag2'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DropdownButton<String>(
            value: _selectedUnit,
            onChanged: (value) {
              setState(() {
                _selectedUnit = value!;
              });
            },
            items: <String>['km', 'mi', 'm', 'optional unit']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          CupertinoButton(
            child: Text("Submit"),
            onPressed: ()async {
              final Map<String, String> queryParams = {
                'lat1': lat1Controller.text,
                'lag1': lag1Controller.text,
                'lat2': lat2Controller.text,
                'lag2': lag2Controller.text,
                'unit': _selectedUnit,
              };
              var a = await ApiServices.differenceBetweenTwoLatLang(map: queryParams);
              setState(() {
                distance = "distance : ${a['distance']} ${a['unit']}";
              });
            },
          ),
        ],
      ),
    );
  }
}
