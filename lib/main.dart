// ignore_for_file: unused_local_variable, library_private_types_in_public_api
//TODO (marliz): Agregar lógica para obtener servicios, clientes y pedidos
//TODO: agregar configuración a base de datos.
//NOTE: REquiero corregir los archivos de cada opción de drawer para que cada opción tenga su propio tipo de lista
import 'package:flutter/material.dart';
import 'package:lavanderia_app/Design/app_colors.dart';
import 'package:lavanderia_app/Pages/system_screen.dart';
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
        extensions: const[
          AppColors(
            accentuated: Color(0xFFA06CD5),
            overlay: Color(0xFFC19EE0),
            hint: Color(0xFFDAC3E8),
          )
        ],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xffA06CD5), // Color de fondo
          foregroundColor: Colors.white, // Color del icono
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: const Color(0xffA06CD5),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          ),
        ) 
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

  void _login() { // Función para iniciar sesión. 
  //TODO: Agregar lógica de inicio de sesión aquí, esto es solo un ejemplo con un snackbar.
    final username = _usernameController.text;
    final password = _passwordController.text;
    //todo: Comentar esto y descomentar el If de abajo para que funcione el login 
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Sistema()),
      );
   /*  if (username == 'someone' && password == 'password') {
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login exitoso')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Sistema()),
      );
    } else {
      // Simula un error de inicio de sesión
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario o contraseña incorrectos')),
      );
    } */
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
      )
    );
  }
}
