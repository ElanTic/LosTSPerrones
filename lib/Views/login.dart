import 'package:flutter/material.dart';
import 'inicio.dart';

String username = " ";
String password = " ";

class LoginScreen extends StatefulWidget {
  @override
  _LoginStateScreen createState() => _LoginStateScreen();
}

class _LoginStateScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Itemtrackers'),
          backgroundColor: Colors.blueAccent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    onChanged: (userNameTF) {
                      username = userNameTF;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Username'),
                  ),
                  TextField(
                    onChanged: (passwordTF) {
                      password = passwordTF;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Password'),
                  ),
                  Builder(
                      builder: (context) => ElevatedButton(
                          onPressed: () {
                            if (username != " " && password != " ") {
                              print("Username: " + username);
                              print("Password: " + password);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Inicio()));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Text('Error falta de datos'),
                                        content:
                                            Text('Falta Usuario o Password'),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: Text('OK')),
                                        ],
                                      ));
                            }
                          },
                          child: Text('Entrar'))),
                  ButtonBar(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TextButton(
                            onPressed: () {
                              print('Registrarse');
                            },
                            child: Text('Registrarse')),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TextButton(
                            onPressed: () {
                              print('Olvide Contra');
                            },
                            child: Text('Olvidé mi Contraseña')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
