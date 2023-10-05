import 'package:flutter/material.dart';
import 'package:itemtrackers/models/Joven.dart';
import 'package:itemtrackers/models/Pertenencia.dart';

class FichaObjetoP {
  int id;
  DateTime dateFound;
  DateTime dateLost;
  String ubicacion;
  bool isFound; // true if found, false if lost
  String ownerId; // foreign key referencing joven_0
  int pertenenciaId; // foreign key referencing pertenencia

  FichaObjetoP({
    required this.id,
    required this.dateLost,
    required this.dateFound, //no es cierto
    this.ubicacion = '',
    //required this.pertenencia,
    //required this.propietario,
    required this.isFound,
    required this.ownerId,
    required this.pertenenciaId,
  });
}
