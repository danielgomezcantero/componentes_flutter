import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
        backgroundColor: Colors.purple,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // print(menuProvider.opciones);
    // no es una opción viable porque puede ser que el dato tarde en cargarse
    //menuProvider.cargarData().then((value) => print(value));

    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listaItems(snapshot.data, context),
          );
        });
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.indigoAccent,
        ),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);

          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;

    // Es la forma de crear listas sin Json
    // return [
    //   ListTile(
    //     title: Text('Desde _listaItems'),
    //   ),
    //   Divider(),
    //   ListTile(
    //     title: Text('Desde _listaItems'),
    //   ),
    //   Divider(),
    //   ListTile(
    //     title: Text('Desde _listaItems'),
    //   ),
    //   Divider(),
    // ];
  }
}
