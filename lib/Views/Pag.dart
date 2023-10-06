import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:itemtrackers/models/FichaObjetoP.dart';
import 'package:itemtrackers/models/Joven.dart';
import 'package:itemtrackers/rest/RDS_Publicacion.dart';
import 'package:itemtrackers/rest/RDS_joven.dart';
import 'package:itemtrackers/models/Pertenencia.dart';

class Pag extends StatefulWidget {
  const Pag({super.key});

  @override
  State<Pag> createState() => _PagState();
}

class _PagState extends State<Pag> {
  late Future<Joven> futureJoven;
  List<Pertenencia> lista = [];

  @override
  void initState() {
    super.initState();
    RDS_joven rdsj = RDS_joven();

    futureJoven = rdsj.getJoven("Jane Doe");

    RDS_Publicacion rdsp = RDS_Publicacion();

    //ficha con id
    late Future<FichaObjetoP> ficha = rdsp.getFichaObjetoP('1');
    ficha.then((fichaObjeto) {
      print('Attribute 1: ${fichaObjeto.ownerId}');
      print('voltea es esto');
    }).catchError((error) {
      print('Error fetching FichaObjetoP: $error');
    });
    //todas las fichas
    late Future<List<FichaObjetoP>> fichas = rdsp.getAll();
    fichas.then((listOfFichas) {
      for (var fichaObjeto in listOfFichas) {
        print('Attribute 1: ${fichaObjeto.ubicacion}');
        print('Attribute 2: ${fichaObjeto.ownerId}');
        // Add more print statements for other attributes as needed
      }
    }).catchError((error) {
      print('Error fetching FichaObjetoP: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    lista = [
      Pertenencia(
          id: 0,
          dueno: 0,
          nombre: 'algo',
          color: 'si',
          marca: 'si',
          modelo: 'si',
          descripcion: 'una cosa qeu se me perdio jaja',
          foto:
              'https://static.wikia.nocookie.net/sanicman/images/d/d3/Ceyr7zdbxw821.png/revision/latest?cb=20200618024705'),
      Pertenencia(
          id: 0,
          dueno: 0,
          nombre: 'otra cosa',
          color: 'no',
          marca: 'ola',
          modelo: 'adiso',
          descripcion: 'otra casa que se ne perdio por ai jijija',
          foto:
              'https://pm1.aminoapps.com/7088/14d09e999300a7440c0ce49b4d62873e22f10477r1-546-439v2_hq.jpg'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Publicaciones"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            final item = lista[index];
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
      ),
    );
  }
}
