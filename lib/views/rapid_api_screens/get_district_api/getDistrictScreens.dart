import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import '../../../model/get_district_model.dart';
import '../services.dart';

class GetDistrictScreen extends StatefulWidget {
  final Map<String, String> map;
  GetDistrictScreen({Key? key, required this.map}) : super(key: key);

  @override
  State<GetDistrictScreen> createState() => _GetDistrictScreenState();
}

class _GetDistrictScreenState extends State<GetDistrictScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(' your district'),
      ),
      body: Center(
        child: FutureBuilder<List<DistrictAndStateModel>>(
          future: ApiServices.getDistricts(map:widget.map),
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
                    title: Text('District: ${data.district}'),
                    subtitle: Text('State: ${data.state}'),
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
