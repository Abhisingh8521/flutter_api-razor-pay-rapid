import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'getDistrictScreens.dart';


class GetDistrictUsingStateName extends StatefulWidget {
  const GetDistrictUsingStateName({Key? key}) : super(key: key);

  @override
  State<GetDistrictUsingStateName> createState() => _GetDistrictUsingStateNameState();
}

class _GetDistrictUsingStateNameState extends State<GetDistrictUsingStateName> {
  TextEditingController stateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  Text("Enter your state"), ),
      body: Column(

        children: [

          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: stateController,
              decoration: InputDecoration(
                  labelText: 'Enter state name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),

            ),
          ),


          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text("Submit"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        GetDistrictScreen(map: {

                          'state': stateController.text,

                        },),
                  ));
            },
          ),

        ],
      )
    );

  }
}