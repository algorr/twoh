import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/machines.dart';

class LocalApi {
  String baseUrl = "http://192.168.0.14:3000/";

//Getdata from Restful Api
  Future<List<Machines>?> fetchData() async {
    try {
      final response = await http.get(Uri.parse("${baseUrl}machines"));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        final machineList = body.map((e) => Machines.fromJson(e)).toList();
        return machineList;
      }
      return null;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  Future<bool> patchData(Map<String, String> machineObj, int id) async {
    try {
      await http.patch(Uri.parse("${baseUrl}machines/$id"), body: machineObj);
      print("$machineObj");
      return true;
    } catch (e) {
      return false;
    }
  }
}
