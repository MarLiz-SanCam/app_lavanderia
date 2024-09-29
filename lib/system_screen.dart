import 'package:flutter/material.dart';
import 'package:lavanderia_app/app_colors.dart';

class Sistema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.accentuated,
        title: Text('Lavandería App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: colors.accentuated,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.person),
              title: Text('Clientes'),
              onTap: () {
                //TODO: Acción al presionar "Inicio"
              },
            ),
            ListTile(
              leading: Icon(Icons.local_laundry_service),
              title: Text('Servicios'),
              onTap: () {
                // TODO:Acción al presionar "Configuración"
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Pedidos'),
              onTap: () {
                //TODO: Acción al presionar "Acerca de"
              },
            ),
          ],
        ),
      ),
      body: Center(
        
        child: Text('Bienvenido al Sistema de Lavandería'),
      ),
    );
  }
}