import 'dart:convert';
import 'dart:io';

import 'package:itemtrackers/models/Joven.dart';
import 'package:http/http.dart' as http;

class RDS_joven {
  static const String host =
      'https://08e5-2806-103e-13-c7b-8569-63bb-601f-4af1.ngrok-free.app';
  static const String _joven = '/jovenes';

  Future<Joven> getJoven(String name) async {
    try {
      String url = host + _joven + '/' + name;
      print(url);

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
}
