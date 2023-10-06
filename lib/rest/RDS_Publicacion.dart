import 'dart:convert';
import 'dart:io';

import 'package:itemtrackers/models/FichaObjetoP.dart';
import 'package:http/http.dart' as http;

class RDS_ficha {
  static const String host =
      'https://08e5-2806-103e-13-c7b-8569-63bb-601f-4af1.ngrok-free.app';
  static const String _ficha = '/fichas_objeto_p';
}
