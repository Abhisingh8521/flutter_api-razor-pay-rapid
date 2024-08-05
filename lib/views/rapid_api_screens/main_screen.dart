import 'package:flutter/material.dart';
import 'package:flutter_api/views/rapid_api_screens/pincode_details/get_pincode_details.dart';
import 'DistanceBetweenTwoPincodes/distance_between_twoPincodes.dart';
import 'diff_between_two_lat_lang/lat_lang_dialog.dart';
import 'get_district_api/erter_district_name.dart';
import 'get_districtofa_pincode/get_districtofa_pincode_dialog.dart';
import 'get_stateofa_pincode/get_stateofa_pincode_screen.dart';
import 'get_states/get_states.dart';
import 'is_validate_pincode/is_validate_pincode_dialog.dart';
import 'near_by_area_poncode/near_by_area_pincode.dart';
import 'nearby_area_by_lat_lang/nearby_area_bylat_lang.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home Screen",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.blue,
                minWidth: 100,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PincodeDetails(),
                      ));
                },
                child: Text(
                  "Pin Code Api",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            SizedBox(height: 20,),
            MaterialButton(
                color: Colors.blue,
                minWidth: 100,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GetDistrictUsingStateName(),
                      ));
                },
                child: Text(
                  "Get District Api",
                  style: TextStyle(color: Colors.white),
                ),
              ) ,
              SizedBox(height: 30,),
              MaterialButton(
                color: Colors.blue,
                minWidth: 100,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GetStatesScreen(),
                      ));
                },
                child: Text(
                  "Get State ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30,),
              MaterialButton(
                color: Colors.blue,
                minWidth: 100,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StateofaPincodeScreen(),
                      ));
                },
                child: Text(
                  "StateofaPincodeScreen",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30,),
              MaterialButton(
                color: Colors.blue,
                minWidth: 100,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ValidatePincodeDialog(),
                      ));
                },
                child: Text(
                  "ValidatePincodeDialog",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30,),
              MaterialButton(
                color: Colors.blue,
                minWidth: 100,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DistrictofaPincode(),
                      ));
                },
                child: Text(
                  "DistrictofaPincode",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30,),
              MaterialButton(
                color: Colors.blue,
                minWidth: 100,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NearByAreasByPinCode(),
                      ));
                },
                child: Text(
                  "NearByAreasByPinCode",
                  style: TextStyle(color: Colors.white),
                ),
              ),  SizedBox(height: 30,),
              MaterialButton(
                color: Colors.blue,
                minWidth: 100,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NearByAreasBylatLang(),
                      ));
                },
                child: Text(
                  "NearByAreasBylatLang",
                  style: TextStyle(color: Colors.white),
                ),
              ), SizedBox(height: 30,),
              MaterialButton(
                color: Colors.blue,
                minWidth: 100,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DistanceBetweenTwoPinCode(),
                      ));
                },
                child: Text(
                  "DistanceBetweenTwoPinCode",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30,),
              MaterialButton(
                color: Colors.blue,
                minWidth: 100,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DifferenceBetweenTwoLatLang(),
                      ));
                },
                child: Text(
                  "DifferenceBetweenTwoLatLang",
                  style: TextStyle(color: Colors.white),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
