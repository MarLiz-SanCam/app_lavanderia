import 'package:flutter/material.dart';

class GenericListPage extends StatelessWidget {
  final String title;
  final Future<List<String>> Function() fetchItems;
  final Widget Function() formPageBuilder; // Constructor para el formulario

  GenericListPage({
    required this.title,
    required this.fetchItems,
    required this.formPageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: FutureBuilder<List<String>>(
        future: fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay datos disponibles.'));
          }

          final items = snapshot.data!;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
                onTap: () {
                  // Acción al tocar el item
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navega a la página de formulario
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => formPageBuilder()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
