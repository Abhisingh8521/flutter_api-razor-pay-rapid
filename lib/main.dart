import 'package:flutter/material.dart';
import 'package:flutter_api/views/razorpay_item_api_screens/screens/create_item_screens.dart';
import 'package:flutter_api/views/screens/home_screen.dart';

import 'views/rapid_api_screens/main_screen.dart';

void main() {
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home:  CreateItemsScreen(),
    );
  }
}
