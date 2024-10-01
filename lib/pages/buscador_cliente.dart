// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:showroom_maqueta/rutas/routes.dart';

class BuscadorCliente extends StatelessWidget {
  List listClientes = [
    'Miguel Ohara',
    'Penny Parker',
    'Gwen Stacy',
    'Miles Morales',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Cliente',
          style: TextStyle(
            fontSize: 24,
          )
        ),
        elevation: 0,
        backgroundColor: Color(0xFFFD725A),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none, prefixIcon: Icon(Icons.search)),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: listClientes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        router.go('/buscadorCliente/paginaCliente');
                      },
                      leading: Icon(
                        Icons.person,
                        size: 42,
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 50,
                      ),
                      title: Text(listClientes[index]),
                      subtitle: Text('Cantidad de pedidos: 4'),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      router.go('/menu/origen');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                        color: Color(0xFFFD725A),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text(
                        'Atrás',
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
                      router.go('/');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                        color: Color(0xFFFD725A),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text(
                        'Cerrar Sesion',
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
            ],
          ),
        ),
      ),
    );
  }
}
