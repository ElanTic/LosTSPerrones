import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
        child: Column(
          children: [
            Text("Deescripción de la publicación"),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descripción',
              ),
            ),
            const SizedBox(height: 30),
            returnImage != null
                ? Image.file(returnImage!)
                : const Text("Selecciona una imagen"),
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
              onPressed: () {},
              child: Text('Añadir ubicacion de perdida'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Añadir publicación'),
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
      maxWidth: 800,
      maxHeight: 800,
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
