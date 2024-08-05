import 'package:flutter/material.dart';

import '../services.dart';


class GetStatesScreen extends StatefulWidget {
  const GetStatesScreen({Key? key}) : super(key: key);

  @override
  State<GetStatesScreen> createState() => _GetStatesScreenState();
}

class _GetStatesScreenState extends State<GetStatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("All States",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: FutureBuilder<List>(
          future: ApiServices.getStates(),
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
                    title: Text(data),
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
