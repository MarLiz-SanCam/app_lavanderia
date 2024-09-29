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
        child: GridView.builder(
          padding: const EdgeInsets.all(20.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: 2,
         itemBuilder: (context, index) {
  return Card(
    color: Colors.white,
    elevation: 10,
    margin: EdgeInsets.all(8),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //TODO: volver los íconos dinámicos
              Icon(Icons.star, size: 24), // Ícono
              SizedBox(width: 8), // Espacio entre el ícono y el título
              Text(
                'Pedido $index',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 16), // Espacio entre el título y los botones
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Acción para el primer botón
                },
                child: Text('Botón 1'),
              ),
              SizedBox(height: 8), // Espacio entre los botones
              ElevatedButton(
                onPressed: () {
                  // Acción para el segundo botón
                },
                child: Text('Botón 2'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

        )
      ),
    );
  }
}
//TODO: Agregar un botón flotante después de completar el grid

/* floatingActionButton: FloatingActionButton(
  onPressed: () {
    // Acción al presionar el botón
  },
  backgroundColor: colors.accentuated,
  child: Icon(Icons.add),
), */