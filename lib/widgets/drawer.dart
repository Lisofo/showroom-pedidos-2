import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:showroom_maqueta/rutas/routes.dart';
import '../provider/menu_provider.dart';
import 'icon_string.dart';

class BotonesDrawer extends StatefulWidget {
  const BotonesDrawer({super.key});

  @override
  State<BotonesDrawer> createState() => _BotonesDrawerState();
}

class _BotonesDrawerState extends State<BotonesDrawer> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: const [],
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: menuProvider.opciones.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Text(
                  menuProvider.opciones[index]['camino'],
                  style: const TextStyle(color: Colors.black),
                ),
                collapsedIconColor: colors.secondary, //Colors.green.shade700,
                iconColor: colors.secondary, //Colors.green.shade700,
                initiallyExpanded: true,
                children: _filaBotones2(snapshot.data, context, menuProvider.opciones[index]['opciones']),
              );
            },
          );
        });
  }
}

List<Widget> _filaBotones2(data, context, opciones,) {
  final List<Widget> opcionesRet = [];
  opciones.forEach((opt) {
    final widgetTemp = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          getIcon(opt['icon'], context),
          TextButton(
            onPressed: () {
              // Provider.of<OrdenProvider>(context, listen: false).setPageName(opt['texto']);
              router.go(opt['ruta']);
              
              
            },
            child: Text(opt['texto'],
             style: const TextStyle(color: Colors.black),
            )
          ),
        ],
      ),
    );
    opcionesRet.add(widgetTemp);
  });
  return opcionesRet;
}
