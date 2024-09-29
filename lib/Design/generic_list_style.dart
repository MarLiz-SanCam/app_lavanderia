import 'package:flutter/material.dart';
//FIXME: eliminar esta página generica para las listas y agregar una específica para cada una.
// Clases de datos
//DEPRECATED: I´m not using this anymore - Cambiar mañana por las opciones correctas para la funcionalidad requerida
class Client {
  final String name;
  final String phone;

  Client({required this.name, required this.phone});
}

class Service {
  final String name;
  final String description;
  final double price;

  Service({required this.name, required this.description, required this.price});
}

class Order {
  final String id;
  final List<Service> services;

  Order({required this.id, required this.services});
}

// Clase GenericListPage
class GenericListPage extends StatefulWidget {
  final String title;
  final Future<List<dynamic>> Function() fetchItems; // Función para obtener datos
  final Widget Function() formPageBuilder; // Builder para el formulario
  final Widget Function(dynamic item) itemBuilder; // Builder para el ListTile

  GenericListPage({
    required this.title,
    required this.fetchItems,
    required this.formPageBuilder,
    required this.itemBuilder,
  });

  @override
  _GenericListPageState createState() => _GenericListPageState();
}

class _GenericListPageState extends State<GenericListPage> {
  late Future<List<dynamic>> _items;

  @override
  void initState() {
    super.initState();
    _items = widget.fetchItems(); // Cargar datos al iniciar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _items,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay elementos'));
          }

          return ListView(
            children: snapshot.data!.map((item) => widget.itemBuilder(item)).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.formPageBuilder()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Funciones para construir los ListTiles
  Widget buildClientTile(Client client) {
    return ListTile(
      title: Text(client.name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('Teléfono: ${client.phone}', style: TextStyle(color: Colors.grey[600])),
      trailing: IconButton(
        icon: Icon(Icons.phone),
        onPressed: () {
          // Acción para llamar al cliente
        },
      ),
      onTap: () {
        // Acción para ver detalles del cliente
      },
    );
  }

  Widget buildServiceTile(Service service) {
    return ListTile(
      title: Text(service.name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('Descripción: ${service.description}'),
      trailing: Text('\$${service.price}', style: TextStyle(color: Colors.green)),
      onTap: () {
        // Acción para ver detalles del servicio
      },
    );
  }

  Widget buildOrderTile(Order order) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Número de Pedido: #${order.id}', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Servicios:'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: order.services.map((service) => Text('- ${service.name}')).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Cerrar')),
                SizedBox(width: 8.0),
                ElevatedButton(onPressed: () {}, child: Text('Cancelar')),
                SizedBox(width: 8.0),
                ElevatedButton(onPressed: () {}, child: Text('Modificar')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
