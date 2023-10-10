import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:itemtrackers/models/FichaObjetoP.dart';
import 'package:itemtrackers/models/Joven.dart';
import 'package:itemtrackers/rest/RDS_Publicacion.dart';
import 'package:itemtrackers/rest/RDS_joven.dart';
import 'package:itemtrackers/models/Pertenencia.dart';
import 'package:itemtrackers/rest/RDS_pertenencia.dart';

class Objetos extends StatefulWidget {
  const Objetos({super.key});

  @override
  State<Objetos> createState() => _ObjetosState();
}

class _ObjetosState extends State<Objetos> {
  late Future<List<Pertenencia>> objetos;

  @override
  void initState() {
    super.initState();

    RDS_pertenencia rdso = RDS_pertenencia();

    objetos = rdso.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Publicaciones"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<Pertenencia>>(
          future: objetos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show loading indicator
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Pertenencia> pertenencias = snapshot.data!;
              return ListView.builder(
                itemCount: pertenencias.length,
                itemBuilder: (context, index) {
                  final item = pertenencias[index];
                  return Pertenencia(
                      id: item.id,
                      dueno: item.dueno,
                      nombre: item.nombre,
                      color: item.color,
                      marca: item.marca,
                      modelo: item.modelo,
                      descripcion: item.descripcion,
                      foto: item.foto);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

/*
child: ListView.builder(
          itemCount: objetos.length,
          itemBuilder: (context, index) {
            final item = objetos[index];
            return Pertenencia(
                id: item.id,
                dueno: item.dueno,
                nombre: item.nombre,
                color: item.color,
                marca: item.marca,
                modelo: item.modelo,
                descripcion: item.descripcion,
                foto: item.foto);
          },
        ),


*/