import 'package:flutter/material.dart';
import 'package:showroom_maqueta/rutas/routes.dart';

class SeleccionOrigen extends StatefulWidget {
  const SeleccionOrigen({super.key});

  @override
  State<SeleccionOrigen> createState() => _SeleccionOrigenState();
}

class _SeleccionOrigenState extends State<SeleccionOrigen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Origen'),
        ),
        body: Center(
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                // Orientación vertical
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildInkWell(context, '/buscadorCliente', 'images/ufo-logo.png'),
                    SizedBox(height: 100), // Espacio entre los InkWells
                    buildInkWell(context, '/buscadorCliente', 'images/nyp.jpeg'),
                  ],
                );
              } else {
                // Orientación horizontal
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildInkWell(context, '/buscadorCliente', 'images/ufo-logo.png'),
                    SizedBox(width: 200), // Espacio entre los InkWells
                    buildInkWell(context, '/buscadorCliente', 'images/nyp.jpeg'),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildInkWell(BuildContext context, String route, String imagePath) {
    return InkWell(
      onTap: () {
        router.go(route);
      },
      child: Container(
        height: 200,
        width: 380,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Image.asset(imagePath),
      ),
    );
  }
}
