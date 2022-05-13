import 'package:flutter/material.dart';
import 'package:googlemap/convert_lang_lati_to_address.dart';
import 'package:googlemap/getuserlocation.dart';
import 'package:googlemap/googlePlaceApi.dart';
import 'package:googlemap/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    
      theme: ThemeData(
        // useMaterial3: true,
      
        primarySwatch: Colors.blue,
      ),
      home:  GooglePlaceAPIScreen(),
    );
  }
}
