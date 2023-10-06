import 'dart:convert';
import 'dart:io';

import 'package:itemtrackers/models/FichaObjetoP.dart';
import 'package:http/http.dart' as http;
import 'package:itemtrackers/rest/ApiConfig.dart';

class RDS_Publicacion {
  static const String _ficha = 'fichas_objeto_p';

  Future<FichaObjetoP> getFichaObjetoP(String id) async {
    try {
      String url = ApiConfig.host + _ficha + '/' + id;

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return FichaObjetoP.fromJson(jsonDecode(response.body));
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load FichaObjetoP');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }

  Future<List<FichaObjetoP>> getAll() async {
    try {
      String url = ApiConfig.host + _ficha;

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<FichaObjetoP> fichas =
            jsonResponse.map((data) => FichaObjetoP.fromJson(data)).toList();
        return fichas;
        //return FichaObjetoP.fromJson(jsonDecode(response.body));
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load FichaObjetoP');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }

  Future<bool> postFichaObjetoP(FichaObjetoP fichaObjetoP) async {
    try {
      String url = ApiConfig.host + _ficha;
      print('Request Body: ${jsonEncode(fichaObjetoP.toJson())}');

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(fichaObjetoP.toJson()),
      );
      if (response.statusCode == 200) {
        print('Post successful');
        return true;
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to post FichaObjetoP');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }
}
