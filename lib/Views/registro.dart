import 'package:flutter/material.dart';

void main() {
  runApp(
   MaterialApp(
    home: Registro(),
    ),
  );
}

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre de usuario',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
                obscureText: true, // Para ocultar la contraseña
              ),

              // Botón para completar el registro
              ElevatedButton(
                onPressed: () {
                  //Navegaremos de vuelta a la pantalla de inicio de sesión
                  Navigator.pop(context); // Esto regresará a la pantalla de inicio de sesión
                },
                child: Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
