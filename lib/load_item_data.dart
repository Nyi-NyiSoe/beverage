

import 'package:flutter/services.dart';
import 'dart:convert';
class LoadItemData{
  List<dynamic> juices = [];
  Future<dynamic> readJson() async{
    final String response = await rootBundle.loadString('assets/test.json');
    final data = await json.decode(response);
   return juices = data;
  }
}