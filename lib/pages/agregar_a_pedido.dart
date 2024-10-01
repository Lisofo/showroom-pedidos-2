// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:showroom_maqueta/rutas/routes.dart';


class AgregarPedido extends StatelessWidget {
  List listItems = [
    'AH-5838',
    'AH-2311',
    'AH-4444',
    'AD-1234',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Item'),
        elevation: 0,
        backgroundColor: Color(0xFFFD725A),
      ),
      body: SafeArea(
        child: Column(
        children: [ 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Buscar o escanear item...'
                ),
              )
            ),
          ),
          Divider(thickness: 10.0,),
          SizedBox(height: 10,),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.image,
                        size: 50,
                      ),
                      onTap: () {
                        router.go('/buscadorCliente/paginaCliente/pedidoInterno/agregarAPedido/paginaProducto');
                      },
                      title: Text(listItems[index]),
                      subtitle: Text('Descripcion corta del producto'),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 50,
                      ),
                    );
                  }))
        ],
      )),
    );
  }
}
