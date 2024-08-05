import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/get_district_model.dart';
import '../../model/pincode_model.dart';


class ApiServices {
  static Future<List<PinCodeModel>> getPincodeDetails(
      {required String pinCode}) async {
    final String apiUrl =
        "https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/pincode/$pinCode";

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'X-RapidAPI-Key': 'e960366a58msh06e379882eb0538p19d360jsn8509c61e074a',
        'X-RapidAPI-Host':
        'india-pincode-with-latitude-and-longitude.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => PinCodeModel.fromJson(e)).toList();
    } else {
      throw List<PinCodeModel>.empty();
    }
  }

  static Future<List<DistrictAndStateModel>> getDistricts(
      {required Map<String, String> map}) async {
    const String apiUrl =
        "https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/district";

    final Map<String, String> queryParams = {

      'state': map['state'] ?? 'Tamilnadu',
    };

    final response = await http.get(
      Uri.parse('$apiUrl?${Uri(queryParameters: queryParams).query}'),
      headers: {
        'X-RapidAPI-Key': 'e960366a58msh06e379882eb0538p19d360jsn8509c61e074a',
        'X-RapidAPI-Host':
        'india-pincode-with-latitude-and-longitude.p.rapidapi.com'
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => DistrictAndStateModel.fromJson(e)).toList();
    } else {
      throw List<DistrictAndStateModel>.empty();
    }
  }

  static Future<String?> getDistrictofaPincode({required String pinCode}) async {
    final String apiUrl =
        "https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/pincode/$pinCode/district";

    final response = await http.get(Uri.parse(apiUrl), headers: {
      'X-RapidAPI-Key': 'e960366a58msh06e379882eb0538p19d360jsn8509c61e074a',
      'X-RapidAPI-Host': 'india-pincode-with-latitude-and-longitude.p.rapidapi.com'
    });

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      return data['district'];
    } else {
      return null;
    }
  }

  static Future<String> getStateofaPincode({required String pinCode}) async {
    final String apiUrl =
        "https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/pincode/$pinCode/state";

    final response = await http.get(Uri.parse(apiUrl), headers: {
      'X-RapidAPI-Key': 'e960366a58msh06e379882eb0538p19d360jsn8509c61e074a',
      'X-RapidAPI-Host':
      'india-pincode-with-latitude-and-longitude.p.rapidapi.com'
    });

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      return data['state'];
    } else {
      throw 'somthing went wrong';
    }
  }

  static Future<bool> isValidatePincode({required String pinCode}) async {
    final String apiUrl =
        "https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/pincode/$pinCode/validate";

    final response = await http.get(Uri.parse(apiUrl), headers: {
      'X-RapidAPI-Key': 'e960366a58msh06e379882eb0538p19d360jsn8509c61e074a',
      'X-RapidAPI-Host':
      'india-pincode-with-latitude-and-longitude.p.rapidapi.com'
    });

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      return data['valid'];
    } else {
      return false;
    }
  }

  static Future<List> getStates() async {
    final String apiUrl =
        "https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/state";

    final response = await http.get(Uri.parse(apiUrl), headers: {
      'X-RapidAPI-Key': 'e960366a58msh06e379882eb0538p19d360jsn8509c61e074a',
      'X-RapidAPI-Host':
      'india-pincode-with-latitude-and-longitude.p.rapidapi.com'
    });

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.toList();
    } else {
      return List.empty();
    }
  }

  // static Future<Map> diffrenceBetweenTwoLatLang({required Map<String, String> map}) async {
  //   final String apiUrl =
  //       "https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/distance";
  //
  //   final Map<String, String> queryParams = {
  //     'lat1': map['lat1']??"1.00",
  //     'lag1': map['lag1'] ?? "1.00",
  //     'lat2': map['lat2'] ?? '1.00',
  //     'lag2': map['lag2'] ?? '1.00',
  //     'unit': map['unit'] == 'optional unit' ? 'm':map['unit']??"m",
  //   };
  //
  //   final response = await http.post(Uri.parse("$apiUrl?${Uri(queryParameters: queryParams).query}"),
  //     headers: {
  //       'content-type': 'application/x-www-form-urlencoded',
  //       'X-RapidAPI-Key': 'e960366a58msh06e379882eb0538p19d360jsn8509c61e074a',
  //       'X-RapidAPI-Host': 'india-pincode-with-latitude-and-longitude.p.rapidapi.com'
  //     },);
  //
  //   if (response.statusCode == 200) {
  //     Map data = jsonDecode(response.body);
  //     print(data['unit']);
  //     return data;
  //   } else {
  //     return {"null":"null"};
  //   }
  // }

  static Future<Map> differenceBetweenTwoLatLang({required Map<String, String> map}) async {
    final String apiUrl = "https://india-pincode-with-latitude-and-longitude.p.rapidapi.com/api/v1/distance";

    final Map<String, String> queryParams = {
      'lat1': map['lat1'] ?? "1.00",
      'lng1': map['lng1'] ?? "1.00", // Corrected typo here
      'lat2': map['lat2'] ?? '1.00',
      'lng2': map['lng2'] ?? '1.00', // Corrected typo here
      'unit': map['unit'] == 'optional unit' ? 'm' : map['unit'] ?? "m",
    };

    final response = await http.post(Uri.parse("$apiUrl?${Uri(queryParameters: queryParams).query}"),
      headers: {
        'content-type': 'application/x-www-form-urlencoded',
        'X-RapidAPI-Key': 'e960366a58msh06e379882eb0538p19d360jsn8509c61e074a',
        'X-RapidAPI-Host': 'india-pincode-with-latitude-and-longitude.p.rapidapi.com'
      },
    );

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      print(data['unit']);
      return data;
    } else {
      return {"null": "null"};
    }
  }
}
