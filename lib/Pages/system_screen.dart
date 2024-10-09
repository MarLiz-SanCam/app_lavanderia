// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lavanderia_app/Design/app_colors.dart';
import 'package:lavanderia_app/Design/generic_list_style.dart';
import 'package:lavanderia_app/Pages/add_clients_form.dart';
import 'package:lavanderia_app/Pages/add_order_form.dart';
import 'package:lavanderia_app/Pages/add_service_form.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GenericListPage(
                      title: 'Clientes',
                      fetchItems: () async {
                        //TODO: agreggar: Lógica para obtener clientes
                        return <String>[]; // Return an empty list for now
                      },
                      formPageBuilder: () => AddClientsForm(), itemBuilder: (item) { return Container(); },
                    ),
                  ),
                );
              },

            ),
            ListTile(
              leading: const Icon(Icons.local_laundry_service),
              title: const Text('Servicios'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GenericListPage(
                      title: 'Servicios',
                      fetchItems: () async {
                        //TODO: agregar: Lógica para obtener la lista de servicios
                        return <String>[]; // Return an empty list for now
                      },
                        formPageBuilder: () => AddServiceForm(), itemBuilder: (item) { return Container(); },
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Pedidos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GenericListPage(
                      title: 'Pedidos',
                      fetchItems: () async {
                        //TODO: agreggar: Lógica para obtener pedidos
                        return <String>[]; // Return an empty list for now
                      },
                      formPageBuilder: () => AddOrderForm(), itemBuilder: (item) { return Container(); },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Programación de base de datos',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              'App Lavandería',
              style: TextStyle(fontSize: 20),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuItem(icon:Icons.person, label: "Clientes", destination: AddClientsForm()), 
                MenuItem(icon:Icons.local_laundry_service, label: "Servicios", destination: AddServiceForm()),
                MenuItem(icon:Icons.shopping_cart, label: "Pedidos", destination: AddOrderForm()),
              ],
            )
          ],
        ),
      ), 
    );
  }
}

class MenuItem extends StatelessWidget {  

  final IconData icon;   
  final String label;   
  final Widget destination;  

  MenuItem({required this.icon, required this.label, required this.destination});   
  @override   Widget build(BuildContext context) {
      return GestureDetector(   
        onTap: () {        
          Navigator.push(           
            context,           
            MaterialPageRoute(builder: (context) => destination),        
          );       
        },       
        child: Card(     
          color: Colors.white,    
          margin: EdgeInsets.all(10),         
          child: Padding(           
            padding: const EdgeInsets.all(20.0),           
            child: Column(             
              mainAxisSize: MainAxisSize.min,             
              children: [               
                Icon(icon, size: 40),              
                SizedBox(height: 10),               
                Text(label, style: TextStyle(fontSize: 20)),             
                ],
            ),         
         ),      
      ),    
    );   
  } 
}
