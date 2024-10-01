import 'package:flutter/material.dart';
import 'package:showroom_maqueta/rutas/routes.dart';
import 'package:showroom_maqueta/widgets/drawer.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'Menú',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.orange), // color is on primary,  not primary
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 15, 8),
              child: Text('Usuario',style: const TextStyle(color: Colors.white, fontSize: 24)),
            ),
            IconButton.filledTonal(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red)
              ),
              onPressed: () async {
                logout();
              },
              icon: const Icon(Icons.logout,),
              tooltip: 'Logout',
            )
            
          ],
        ),
        drawer: const Drawer(
          backgroundColor: Colors.white,
          child: BotonesDrawer(),
        ),
        body: Column(
          children: [
            if (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ... [
              Center(
                child: Placeholder(
                  child: Text('Logo'),
                ),
              )
            ] else ... [
              Center(
                child: Placeholder(
                  child: Text('Logo'),
                ),
              )
            ]
          ],
        ),
      )
    );
  }

  void logout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cerrar sesion'),
          content: const Text('Esta seguro de querer cerrar sesion?'),
          actions: [
            TextButton(
              onPressed: () {
                router.pop();
              },
              child: const Text('Cancelar')
            ),
            TextButton(
              onPressed: () {
                //Provider.of<OrdenProvider>(context, listen: false).setToken('');
                router.go('/');
              },
              child: const Text(
                'Cerrar Sesion',
                style: TextStyle(color: Colors.red),
              )
            ),
          ],
        );
      },
    );
  }
}