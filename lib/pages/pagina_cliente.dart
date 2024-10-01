// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:showroom_maqueta/rutas/routes.dart';

class PaginaCliente extends StatelessWidget {
  List listaPedidos = [
    'Pedido 114',
    'Pedido 115',
    'Pedido 116',
    'Pedido 117',
    'Pedido 118',
    'Pedido 119',
    'Pedido 120',
    'Pedido 121',
    'Pedido 122',
    'Pedido 123',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFD725A),
        title: Text('Pedidos del Cliente'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Miguel Ohara',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    Text('1431',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Colors.black54.withOpacity(0.6)
                      )
                    )
                  ],
                ),
              ),
            ),
            Divider(thickness: 15.0),
            Expanded(
              child: ListView.builder(
                itemCount: listaPedidos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      router.go('/buscadorCliente/paginaCliente/pedidoInterno');
                    },
                    title: Text(listaPedidos[index]),
                    subtitle: Text('Estado: En Proceso'),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 50,
                    ),
                  );
                }
              )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                        color: Color(0xFFFD725A),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text(
                        'Atras',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Colors.white.withOpacity(0.9)
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      router.go('/buscadorCliente/paginaCliente/nuevoPedido');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                        color: Color(0xFFFD725A),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text(
                        'Nuevo Pedido',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Colors.white.withOpacity(0.9)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}
