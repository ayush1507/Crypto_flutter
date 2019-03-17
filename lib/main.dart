import 'package:crypto_flutter/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(MyApp(currencies));}

class MyApp extends StatelessWidget {
  MyApp(this._currencies);
  final List _currencies;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.pink),
      home: new HomePage(_currencies),
    );
  }
}


//Fetch all the currencies from api.
//Returns as response, whenever in future req.
Future<List> getCurrencies() async {
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(cryptoUrl);
  //await means that JSON (NEXT LINE) will not be conducted until we get reponse
  return jsonDecode(response.body);
}
