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

  @override
  void initState() {
    super.initState();

    RDS_Publicacion rdsp = RDS_Publicacion();
    FichaObjetoP ficha = FichaObjetoP(
        id: 0, ubicacion: 'no recuerdo', ownerId: 'Jane Doe', pertenenciaId: 5);
    rdsp.postFichaObjetoP(ficha);
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => _model.unfocusNode.canRequestFocus
      // ? FocusScope.of(context).requestFocus(_model.unfocusNode)
      // : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        //backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          //backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Opciones',
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  label: Text('Mi Cuenta'), // <-- Text
                  backgroundColor: Colors.black,
                  icon: Icon(
                    // <-- Icon
                    Icons.account_box,
                    size: 60.0,
                  ),
                  onPressed: () {},
                ),
                FloatingActionButton.extended(
                  label: Text('Mis cosas'), // <-- Text
                  backgroundColor: Colors.black,
                  icon: Icon(
                    // <-- Icon
                    Icons.archive,
                    size: 60.0,
                  ),
                  onPressed: () {},
                ),
                FloatingActionButton.extended(
                    label: Text('Mis publicaciones'), // <-- Text
                    backgroundColor: Colors.black,
                    icon: Icon(
                      // <-- Icon
                      Icons.description,
                      size: 60.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Formulario()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
