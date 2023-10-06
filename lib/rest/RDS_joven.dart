import 'dart:convert';
import 'dart:io';

import 'package:itemtrackers/models/Joven.dart';
import 'package:http/http.dart' as http;
import 'package:itemtrackers/rest/ApiConfig.dart';

class RDS_joven {
  static const String _joven = 'jovenes';

  Future<Joven> getJoven(String name) async {
    try {
      String url = ApiConfig.host + _joven + '/' + name;

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        //print(response.body); // Print the response body for debugging
        //final jsonResponse = jsonDecode(response.body);
        //print(jsonResponse);
        return Joven.fromJson(jsonDecode(response.body));
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load Joven');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }

  Future<List<Joven>> getAllJovenes() async {
    try {
      String url =
          ApiConfig.host + _joven; // Assuming this URL retrieves all Jovenes
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<Joven> jovenes =
            jsonResponse.map((data) => Joven.fromJson(data)).toList();
        return jovenes;
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load Jovenes');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }
}
