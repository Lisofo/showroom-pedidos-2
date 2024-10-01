// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:showroom_maqueta/models/Colores.dart';
import 'package:showroom_maqueta/rutas/routes.dart';

class ProductPage extends StatelessWidget {
  bool isSelected = false;
  List talles = [
    'XS',
    'S',
    'M',
    'L',
    'XL',
    '2XL',
    '3XL',
  ];

  List<ProductColor> colores = [
    ProductColor(
      //colorHexCode: colorHexCode, 
      r: 255, 
      g: 0, 
      b: 0, 
      //codColor: codColor, 
      nombreColor: 'Rojo', 
      isSelected: false,
    ),
    ProductColor(
      //colorHexCode: colorHexCode, 
      r: 0, 
      g: 255, 
      b: 0, 
      //codColor: codColor, 
      nombreColor: 'Verde', 
      isSelected: false,
    ),
    ProductColor(
      //colorHexCode: colorHexCode, 
      r: 0, 
      g: 0, 
      b: 255, 
      //codColor: codColor, 
      nombreColor: 'Azul', 
      isSelected: false,
    ),
  ];


  Color getTextColor(Color backgroundColor) {
    var luminance = 0.2126 * backgroundColor.red +
        0.7152 * backgroundColor.green +
        0.0722 * backgroundColor.blue;
    // Decide si el texto debería ser oscuro o claro en función de la luminosidad
    return luminance > 128 ? Colors.black : Colors.white;
  }

  Wrap showColorButtons() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      children: [
        for (var color in colores)
        ElevatedButton.icon(
          icon: color.isSelected ? Icon(Icons.check, color: getTextColor(Color.fromARGB(255, color.r, color.g, color.b)),) : SizedBox(),
          onPressed: () {
            router.go('/buscadorCliente/paginaCliente/pedidoInterno/agregarAPedido/paginaProducto/paginaTalles');
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, color.r, color.g, color.b)),
          ),
          label: Text(
            '${color.nombreColor} ',
            style: TextStyle(
              fontSize: 25,
              color: getTextColor(Color.fromARGB(255, color.r, color.g, color.b)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.blueGrey[200]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AH-5838',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Text(
                    'Seleccione Variante', 
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.w400
                    )
                  )
                ),
                SizedBox(height: 20,),
                Center(child: showColorButtons())
      
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

