import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itemtrackers/models/FichaObjetoP.dart';
import 'package:itemtrackers/rest/RDS_Publicacion.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  late Future<FichaObjetoP> futureFichaObjetoP;

  @override
  void initState() {
    super.initState();
    RDS_Publicacion rdsp = RDS_Publicacion();
    futureFichaObjetoP = rdsp.getFichaObjetoP('1');
    late Future<FichaObjetoP> ficha = rdsp.getFichaObjetoP('1');
    //late Future<List<FichaObjetoP>> fichas = rdsp.getAll();

    ficha.then((fichaObjeto) {
      print('Attribute 1: ${fichaObjeto.ownerId}');
      print('voltea es esto');
    }).catchError((error) {
      print('Error fetching FichaObjetoP: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Formulario")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
        ));
  }
}
