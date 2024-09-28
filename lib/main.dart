import 'package:flutter/material.dart';
import 'package:lavanderia_app/app_colors.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lavandería App',
      theme: ThemeData.light().copyWith(
        extensions: const[AppColors(
          accentuated: Color(0xFFA06CD5),
          overlay: Color(0xFFC19EE0),
          hint: Color(0xFFDAC3E8),
        )],
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: const Color(0xffA06CD5),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          ),)
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() { // Función para iniciar sesión. 
  //TODO: Agregar lógica de inicio de sesión aquí, esto es solo un ejemplo con un snackbar.
    final username = _usernameController.text;
    final password = _passwordController.text;

    
    if (username == 'some' && password == 'password') {
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login exitoso')),
      );
    } else {
      // Simula un error de inicio de sesión
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuario o contraseña incorrectos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LAUNDRY APP'),
      ),
      body: Padding(
        Color
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
