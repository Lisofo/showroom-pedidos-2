import 'package:flutter/material.dart';
import 'package:showroom_maqueta/rutas/routes.dart'; // Asegúrate de que este import esté correcto

class PedidoInterno extends StatelessWidget {
  final List<String> imgList = [
    'AH-5838',
    'AH-2311',
    'AH-4444',
    'AD-1234',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pedido 114',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                fontSize: 30,
                color: Colors.black)),
        elevation: 0,
        backgroundColor: Color(0xFFFD725A),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              if (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ... [
                Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        router.go('/buscadorCliente/paginaCliente/');
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        router.go('/buscadorCliente/paginaCliente/pedidoInterno/nuevoPedido');
                      },
                      child: Icon(Icons.more_horiz, size: 30),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 5),
                child: Column(
                  children: [
                    for (int i = 0; i < imgList.length; i++)
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            imgList[i],
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black.withOpacity(0.7)
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 140,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Image.asset('images/${imgList[i]}.jpeg'),
                                    ),
                                  ],
                                ),
                                Checkbox(
                                  activeColor: Color(0xFFFD725A),
                                  value: true,
                                  onChanged: (value) {}
                                ),
                                IconButton(
                                  onPressed: () {
                                    router.go('/buscadorCliente/paginaCliente/pedidoInterno/paginaProducto');
                                  },
                                  icon: Icon(Icons.edit),
                                  color: Colors.redAccent,
                                ),
                                
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                  color: Colors.redAccent,
                                ),
                              ],
                            ),
                            Text(
                              'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24,),
                            ),
                            SizedBox(height: 20),
                            SingleChildScrollView(scrollDirection: Axis.horizontal, child: tablaVertical()),
                          ],
                        ),
                      ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Seleccionar Todos',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        Checkbox(
                          activeColor: Color(0xFFFD725A),
                          value: true,
                          onChanged: (value) {}
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Cantidad de Items: ',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '4',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Total A Pagar: ',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '\$950.00',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            router.go('/buscadorCliente/paginaCliente/pedidoInterno/checkout');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                            decoration: BoxDecoration(
                                color: Color(0xFFFD725A),
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'Confirmar',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            router.go('/buscadorCliente/paginaCliente/pedidoInterno/agregarAPedido');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Color(0xFFFD725A),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Text(
                              'Agregar +',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                color: Colors.white.withOpacity(0.9)
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Color(0xFFFD725A),
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'Imprimir',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
              ] else ... [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          router.go('/buscadorCliente/paginaCliente/');
                        }, 
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          router.go('/buscadorCliente/paginaCliente/pedidoInterno/nuevoPedido');
                        },
                        child: Icon(Icons.more_horiz, size: 30),
                      ),
                    ]
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 5),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          for (int i = 0; i < imgList.length; i++)
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  activeColor: Color(0xFFFD725A),
                                  value: true,
                                  onChanged: (value) {}
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 140,
                                      width: 140,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                      child: Image.asset('images/${imgList[i]}.jpeg'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            imgList[i],
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black.withOpacity(0.7)
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: Column(
                                      children: [
                                        Text('Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500', style: TextStyle(fontSize: 24),),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: tablaHorizontal()),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              router.go('/buscadorCliente/paginaCliente/pedidoInterno/paginaProducto');
                                            },
                                            icon: Icon(Icons.edit),
                                            color: Colors.redAccent,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          IconButton(
                                            onPressed: (){},
                                            icon: Icon(Icons.delete),
                                            color: Colors.redAccent,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Seleccionar Todos',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 65,
                          ),
                          Checkbox(
                            activeColor: Color(0xFFFD725A),
                            value: true,
                            onChanged: (value) {}
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Cantidad de Items:',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 41,),
                            Text(
                              '4',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Total A Pagar:',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 20,),
                            Text(
                              '\$950.00',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              router.go('/buscadorCliente/paginaCliente/pedidoInterno/checkout');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                              decoration: BoxDecoration(
                                color: Color(0xFFFD725A),
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Text(
                                'Confirmar Pedido',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  color: Colors.white.withOpacity(0.9)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 40,),
                          InkWell(
                            onTap: () {
                              router.go('/buscadorCliente/paginaCliente/pedidoInterno/agregarAPedido');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                              decoration: BoxDecoration(
                                color: Color(0xFFFD725A),
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Text(
                                'Agregar Item',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  color: Colors.white.withOpacity(0.9)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 40,),
                          InkWell(
                            onTap: () {
                              
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                              decoration: BoxDecoration(
                                color: Color(0xFFFD725A),
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Text(
                                'Imprimir',
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
                    ]
                  )                  
                )
              ],
            ]  
          )   
        ),
      ),
    );
  }

  DataTable tablaHorizontal() {
    return DataTable(
      border: TableBorder.all(),
      columns: [
        DataColumn(
          label: SizedBox(
            width: 38,
          ),
        ),
        DataColumn(
          label: Text('Talles'),
        ),
        DataColumn(
            label: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Center(
              child: Text(
            'XS',
            style: TextStyle(color: Colors.black),
          )),
        )),
        DataColumn(
            label: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Center(
              child: Text(
            "S",
            style: TextStyle(color: Colors.black),
          )),
        )),
        DataColumn(
            label: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Center(
              child: Text(
            "M",
            style: TextStyle(color: Colors.black),
          )),
        )),
        DataColumn(
            label: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Center(
              child: Text(
            "L",
            style: TextStyle(color: Colors.black),
          )),
        )),
        DataColumn(
            label: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Center(
              child: Text(
            "XL",
            style: TextStyle(color: Colors.black),
          )),
        )),
        DataColumn(
            label: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Center(
              child: Text(
            "2XL",
            style: TextStyle(color: Colors.black),
          )),
        )),
        DataColumn(
            label: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Center(
              child: Text(
            "3XL",
            style: TextStyle(color: Colors.black),
          )),
        )),
      ],
      rows: [
        ultimaFilaHorizontal(Colors.red),
        ultimaFilaHorizontal(Colors.blue),
        ultimaFilaHorizontal(Colors.green),
        ultimaFilaHorizontal(Colors.purple),
        ultimaFilaHorizontal(Colors.lime),
      ],
    );
  }

  DataRow ultimaFilaHorizontal(Color miColor) {
    return DataRow(cells: [
      DataCell(
        CircleAvatar(backgroundColor: miColor),
      ),
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cant:',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'Precio:',
            style: TextStyle(fontSize: 14),
          ),
        ],
      )),
      DataCell(Column(
        children: [
          Text('5'),
          Text('\$890.0'),
        ],
      )),
      DataCell(Column(
        children: [
          Text('5'),
          Text('\$890.0'),
        ],
      )),
      DataCell(Column(
        children: [
          Text('5'),
          Text('\$890.0'),
        ],
      )),
      DataCell(Column(
        children: [
          Text('5'),
          Text('\$890.0'),
        ],
      )),
      DataCell(Column(
        children: [
          Text('5'),
          Text('\$890.0'),
        ],
      )),
      DataCell(Column(
        children: [
          Text('5'),
          Text('\$890.0'),
        ],
      )),
      DataCell(Column(
        children: [
          Text('5'),
          Text('\$890.0'),
        ],
      )),
    ]);
  }

  DataTable tablaVertical() {
  return DataTable(
    border: TableBorder.all(),
    columns: [
      DataColumn(
        label: Text('Talles'),
      ),
      DataColumn(
        label: CircleAvatar(
          backgroundColor: Colors.red,
        ),
      ),
      DataColumn(
        label: CircleAvatar(
          backgroundColor: Colors.blue,
        ),
      ),
      DataColumn(
        label: CircleAvatar(
          backgroundColor: Colors.green,
        ),
      ),
      DataColumn(
        label: CircleAvatar(
          backgroundColor: Colors.purple,
        ),
      ),
      // DataColumn(
      //   label: CircleAvatar(
      //     backgroundColor: Colors.lime,
      //   ),
      // ),
    ],
    rows: [
      crearFila('XS'),
      crearFila('S'),
      crearFila('M'),
      crearFila('L'),
      crearFila('XL'),
      crearFila('2XL'),
      crearFila('3XL'),
    ],
  );
}

DataRow crearFila(String talle) {
  return DataRow(cells: [
    DataCell(Text(talle, textAlign: TextAlign.center,)),
    crearCelda(),
    crearCelda(),
    crearCelda(),
    crearCelda(),
    //crearCelda(),
  ]);
}

DataCell crearCelda() {
  return DataCell(Column(
    children: [
      Text('5'),
      Text('\$890.0'),
    ],
  ));
}

}
