//import de materialapp
import 'package:flutter/material.dart';
import 'package:itemtrackers/models/FichaObjetoP.dart';
import 'package:itemtrackers/models/Joven.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  //Crea un formulario con un campo de texto y un boton para enviar
  bool objeto = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Fromulario")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Nombre del objeto',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Modelo',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Marca',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Color',
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: const Text('Guardar'),
                )
              ],
            ),
          ),
        ));
  }
}
