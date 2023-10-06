import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itemtrackers/Views/Formulario.dart';
import 'package:itemtrackers/Views/Objetos.dart';
import 'package:itemtrackers/models/FichaObjetoP.dart';
import 'package:itemtrackers/models/Pertenencia.dart';
import 'package:itemtrackers/rest/RDS_Publicacion.dart';
import 'package:itemtrackers/rest/RDS_pertenencia.dart';

class Opciones extends StatefulWidget {
  const Opciones({Key? key}) : super(key: key);

  @override
  _OpcionesState createState() => _OpcionesState();
}

class _OpcionesState extends State<Opciones> {
  //late HomePageModel _model;
  late Future<List<FichaObjetoP>> fichas;

  @override
  void initState() {
    super.initState();

    RDS_Publicacion rdsp = RDS_Publicacion();
    fichas = rdsp.getAll();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FichaObjetoP>>(
      future: fichas,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<FichaObjetoP> pertenencias = snapshot.data!;
          return ListView.builder(
            itemCount: pertenencias.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(pertenencias[index].ownerId),
                // Add more widgets to display other properties of Pertenencia
              );
            },
          );
        }
      },
    );
  }
}
