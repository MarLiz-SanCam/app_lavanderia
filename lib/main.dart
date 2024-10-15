// ignore_for_file: unused_local_variable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:lavanderia_app/Design/app_colors.dart';
import 'package:lavanderia_app/Pages/system_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lavandería App',
      theme: ThemeData.light().copyWith(
        extensions: const [
          AppColors(
            accentuated: Color(0xFFA06CD5),
            overlay: Color(0xFFC19EE0),
            hint: Color(0xFFDAC3E8),
          )
        ],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xffA06CD5),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: const Color(0xffA06CD5),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:3000/api/gestionar-usuarios'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'p_opcion': 5, // p_opcion (validación de login)
          'p_nombre_usuario': username,
          'p_password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        int valid = data['p_valid']; // p_valid
        String error = data['p_error']; // p_error

        if (valid == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login exitoso')),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Sistema()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $error')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error de conexión: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.accentuated,
        title: const Text('Bienvenid@'),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
