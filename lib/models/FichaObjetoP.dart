import 'package:flutter/material.dart';
import 'package:itemtrackers/models/Joven.dart';
import 'package:itemtrackers/models/Pertenencia.dart';

import 'dart:convert';

class FichaObjetoP {
  int id;
  //DateTime? dateFound; // date_found
  //DateTime? dateLost; // date_lost
  String? ubicacion;
  //bool isFound; // is_found
  String ownerId; // owner_id
  int pertenenciaId; //pertenencia_id

  FichaObjetoP({
    required this.id,
    //this.dateFound,
    //this.dateLost,
    this.ubicacion,
    //required this.isFound,
    required this.ownerId,
    required this.pertenenciaId,
  });

  factory FichaObjetoP.fromJson(Map<String, dynamic> json) {
    return FichaObjetoP(
      id: json['id'],
      //dateFound: DateTime.parse(json['date_found']),
      //dateLost: DateTime.parse(json['date_lost']),
      ubicacion: json['ubicacion'],
      //isFound: json['is_found'],
      ownerId: json['owner_id'],
      pertenenciaId: json['pertenencia_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date_found': "2023-08-30T18:00:00",
      'date_lost': "2023-08-30T18:00:00",
      'ubicacion': ubicacion,
      'is_found': false,
      'owner_id': ownerId,
      'pertenencia_id': pertenenciaId,
    };
  }
}
