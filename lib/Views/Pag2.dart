import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:itemtrackers/Views/Formulario.dart';

class Pag2 extends StatefulWidget {
  const Pag2({super.key});

  @override
  State<Pag2> createState() => _Pag2State();
}

class _Pag2State extends State<Pag2> {
  File? returnImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Añadir publicación"),
      ),
      //creamos un boton para añadir una publicacion, descripcion, subir una imagen de modo local o de la camara

      body: Container(
        padding: EdgeInsets.all(70),
        child: ListView(
          children: [
            Text("Descripción de la publicación"),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descripción',
              ),
            ),
            const SizedBox(height: 30),
            returnImage != null
                ? Image.file(returnImage!)
                : const Text("Agrega una imagen"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            //subir una imagen de modo local
            ElevatedButton(
              onPressed: () {
                getImage();
              },
              child: Text('Subir imagen'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Formulario()));
              },
              child: Text('Describe tu objeto perdido'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Añade una ubicacion de perdida'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Subir publicación'),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    // ignore: deprecated_member_use
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
      maxHeight: 400,
      imageQuality: 2,
    );

    setState(() {
      if (returnImage != null) {
        this.returnImage = File(returnImage.path);
      } else {
        print('No seleccionaste una imagen');
      }
    });
  }
}
