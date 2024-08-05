import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../model/razorpay_item_model/get_item_byid_model.dart';
import '../model/razorpay_item_model/get_items_model.dart';


class ItemsApiController {

  Future<void> createItems(String name, String description, String amount) async {
    String userName = "rzp_test_8q9EoCx5zdsxNX";
    String password = "pUMYU5vyQtM1ckl1ltDmg8rM";
    String basicAuth = 'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

    var response = await http.post(
      Uri.parse("https://api.razorpay.com/v1/items"),
      headers: {
        'authorization': basicAuth,
      },
      body: {
        'name': name,
        'description': description,
        'amount': amount,
        'currency': "INR"
      },
    );

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Create Item Successfully : ${response.statusCode}");
      print("Create Item Successfully : ${response.statusCode}");
    } else {
      print(response.statusCode);
      throw Exception("Failed");
    }
  }
  Future<GetItemsModel> getItemsData()async{
    String userName = "rzp_test_8q9EoCx5zdsxNX";
    String password = "pUMYU5vyQtM1ckl1ltDmg8rM";
    String basicAuth = 'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

    var response = await http.get(Uri.parse("https://api.razorpay.com/v1/items"),
        headers: {'authorization' : basicAuth,}
    );

    if(response.statusCode == 200){
      print("Get Data Successfully : ${response.statusCode}");
      Fluttertoast.showToast(msg: "Get Data Successfully : ${response.statusCode}");
      return GetItemsModel.fromJson(jsonDecode(response.body));
    }else{
      print("Failed : ${response.statusCode}");
      Fluttertoast.showToast(msg: "Failed : ${response.statusCode}");
      return GetItemsModel();
    }

  }
  Future<GetItemByIdModel> getItemByIdData()async{
    String userName = "rzp_test_8q9EoCx5zdsxNX";
    String password = "pUMYU5vyQtM1ckl1ltDmg8rM";
    String basicAuth = 'Basic ${base64.encode(utf8.encode('$userName:$password'))}';
    var response = await http.get(Uri.parse("https://api.razorpay.com/v1/items/item_O7RvB21lwQ02uK"),
        headers: {
          'authorization' : basicAuth,
        }
    );

    if(response.statusCode == 200){
      print("Get Data Successfully : ${response.statusCode}");
      Fluttertoast.showToast(msg: "Get Data Successfully : ${response.statusCode}");
      return GetItemByIdModel.fromJson(jsonDecode(response.body));
    }else{
      print("Failed : ${response.statusCode}");
      Fluttertoast.showToast(msg: "Failed : ${response.statusCode}");
      return GetItemByIdModel();
    }

  }
  Future<void> updateItem(String name, String description, String amount)async{
    String userName = "rzp_test_8q9EoCx5zdsxNX";
    String password = "pUMYU5vyQtM1ckl1ltDmg8rM";
    String basicAuth = 'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

    var response = await http.patch(Uri.parse("https://api.razorpay.com/v1/items/item_O7RvB21lwQ02uK"),
        headers: {
          'authorization' : basicAuth,
        },
        body: {
          'name' : name,
          'description' : description,
          'amount' : amount
        }
    );

    if(response.statusCode == 200){
      Fluttertoast.showToast(msg: "Update Item Successfully : ${response.statusCode}");
      print("Update Item Successfully : ${response.statusCode}");
    }else{
      print("Failed : ${response.statusCode}");
      Fluttertoast.showToast(msg: "Failed : ${response.statusCode}");
    }



  }
  Future<void> deleteItem(String id)async{
    String userName = "rzp_test_8q9EoCx5zdsxNX";
    String password = "pUMYU5vyQtM1ckl1ltDmg8rM";
    String basicAuth = 'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

    var response = await http.delete(Uri.parse("https://api.razorpay.com/v1/items/$id"),
        headers: {
          'authorization' : basicAuth,
        }
    );
    if(response.statusCode == 200){
      Fluttertoast.showToast(msg: "Delete Item Successfully : ${response.statusCode}");
      print("Delete Item Successfully : ${response.statusCode}");
    }else{
      print("Failed : ${response.statusCode}");
      Fluttertoast.showToast(msg: "Failed : ${response.statusCode}");
    }

  }

}