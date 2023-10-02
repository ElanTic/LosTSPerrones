import 'package:flutter/material.dart';
import 'package:itemtrackers/models/Joven.dart';
import 'package:itemtrackers/models/Pertenencia.dart';

class FichaObjetoP {
  int id;
  DateTime fecha;
  String ubicacion;
  //Pertenencia pertenencia;
  //Joven propietario;
  bool status;
  int owner_id;
  int id_pert;

  FichaObjetoP({
    required this.id,
    required this.fecha,
    this.ubicacion = '',
    //required this.pertenencia,
    //required this.propietario,
    required this.status,
    required this.owner_id,
    required this.id_pert,
  });
}
