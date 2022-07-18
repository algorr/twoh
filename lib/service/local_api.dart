import 'dart:convert';


import 'package:http/http.dart' as http;

import '../models/machines.dart';

class LocalApi {
  String url = "http://192.168.0.17:3000/machines";

  Future<List<Machines>?> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      //print(response.body);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        //print(body);
        final machineList = body.map((e) => Machines.fromJson(e)).toList();
        print(machineList);
        return machineList;
      }
      return null;
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
