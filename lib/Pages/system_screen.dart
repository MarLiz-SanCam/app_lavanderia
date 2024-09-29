// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lavanderia_app/Design/app_colors.dart';

class Sistema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.accentuated,
        title: const Text('Lavandería App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: colors.accentuated,
              ),
              child: const Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.person),
              title: const Text('Clientes'),
              onTap: () {
                //TODO: Agregar: Acción al presionar 
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_laundry_service),
              title: const Text('Servicios'),
              onTap: () {
                // TODO: Agregar: Acción al presionar
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Pedidos'),
              onTap: () {
                //TODO: Agregar: Acción al presionar 
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: GridView.builder(
          padding: const EdgeInsets.all(20.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            /*         TODO: Asignar un ícono diferente según la condición
            switch (index % 3) { // Cambia la condición según tu lógica
              case 0:
                iconData = Icons.star;
                break;
              case 1:
                iconData = Icons.favorite;
                break;
              case 2:
                iconData = Icons.thumb_up;
                break;
              default:
                iconData = Icons.help; // Un ícono por defecto
            } */
              return Card(
                color: Colors.white,
                elevation: 10,
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //TODO: volver los íconos dinámicos
                          const Icon(Icons.star, size: 24), // Ícono
                          const SizedBox(width: 8), // Espacio entre el ícono y el título
                          Text(
                            'Pedido $index',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16), // Espacio entre el título y los botones
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Acción para el primer botón
                            },
                            child: const Text('Botón 1'),
                          ),
                          const SizedBox(height: 8), // Espacio entre los botones
                          ElevatedButton(
                            onPressed: () {
                              // Acción para el segundo botón
                            },
                            child: const Text('Botón 2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: Agregar acción: crear nuevo pedido
          // Acción al presionar el botón
        },
        backgroundColor: colors.accentuated,
        child: const Icon(Icons.add),
      ), 
    );
  }
}
