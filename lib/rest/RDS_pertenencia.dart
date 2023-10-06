import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:itemtrackers/models/Pertenencia.dart';
import 'package:itemtrackers/rest/ApiConfig.dart';

class RDS_pertenencia {
  static const String _pertenencia = 'pertenencias';

  Future<Pertenencia> getPertenencia(String id) async {
    try {
      String url = ApiConfig.host + _pertenencia + '/' + id;

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return Pertenencia.fromJson(jsonDecode(response.body));
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load Pertenencia');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }

  Future<List<Pertenencia>> getAll() async {
    try {
      String url = ApiConfig.host + _pertenencia;

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<Pertenencia> pertenencias =
            jsonResponse.map((data) => Pertenencia.fromJson(data)).toList();
        return pertenencias;
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load Pertenencias');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }
}
