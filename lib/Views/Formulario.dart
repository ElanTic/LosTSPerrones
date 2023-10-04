//import de materialapp
import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  //Crea un formulario con un campo de texto y un boton para enviar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Fromulario")),
        body: Form(
          child: Form(
            child: Column(
              children: [
                TextFormField(),
                TextFormField(),
                SwitchListTile(value: false, onChanged: (bool? value) {}),
                MaterialButton(
                  onPressed: () {},
                  child: Text('Guardar'),
                )
              ],
            ),
          ),
        ));
  }
}
