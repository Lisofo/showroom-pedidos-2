import 'package:flutter/material.dart';
import 'package:showroom_maqueta/rutas/routes.dart';

class PaginaCheckout extends StatelessWidget {
  const PaginaCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        elevation: 0,
        backgroundColor: Color(0xFFFD725A),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, //todo agregar a otras apps
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ... [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Condiciones:',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextField(
                          minLines: 1,
                          maxLines: 10,
                          // decoration:
                          //     InputDecoration(border: OutlineInputBorder()),
                        )
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Metodo de Envio:',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextField(
                          minLines: 1,
                          maxLines: 10,
                          // decoration:
                          //     InputDecoration(border: OutlineInputBorder()),
                        )
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Total de Articulos: ',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '4',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Total del Pedido: ',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'UYU \$950.54',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              router.go('/buscadorCliente/paginaCliente/pedidoInterno');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                              decoration: BoxDecoration(
                                color: Color(0xFFFD725A),
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Text(
                                'Guardar Pedido',
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
                      )
                    ],
                  ),
                  
                ]else ... [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Condiciones:',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: TextField(
                              minLines: 1,
                              maxLines: 10,
                              // decoration:
                              //     InputDecoration(border: OutlineInputBorder()),
                            )
                          )
                        ],
                      ),
                      SizedBox(width: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Metodo de Envio:',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: TextField(
                              minLines: 1,
                              maxLines: 10,
                              // decoration:
                              //     InputDecoration(border: OutlineInputBorder()),
                            )
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Total de Articulos:',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      Text(
                        '4',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Total del Pedido:',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'UYU \$950.54',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          router.go('/buscadorCliente/paginaCliente/pedidoInterno');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                          decoration: BoxDecoration(
                            color: Color(0xFFFD725A),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text(
                            'Guardar Pedido',
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
                  )
                ],
              ],
            ),
          )
        ),
      ),
    );
  }
}
