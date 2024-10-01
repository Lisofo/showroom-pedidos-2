import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'rutas/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English
        Locale('es', 'UY'), // Spanish
      ],
      // initialRoute: '/',
      // routes: getApplicationRoutes(),
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(builder: (context) => Login());
      // },
    );
  }
}

// class Cliente {
//   late final int clienteId;
//   late final String codCliente;
//   late final String name;
//   late final String rut;
//   late final String direccion;
//   late final String telefono;
//   late final String mail;
//   late final String condPago;
//   late final int agenciaId;
//   late final String nombreAgencia;

//   Cliente({
//     required this.clienteId,
//     required this.codCliente,
//     required this.name,
//     required this.rut,
//     required this.direccion,
//     required this.telefono,
//     required this.mail,
//     required this.condPago,
//     required this.agenciaId,
//     required this.nombreAgencia,
//   });

//   Cliente.empty() {
//     clienteId = 0;
//     codCliente = '';
//     name = '';
//     rut = '';
//     direccion = '';
//     telefono = '';
//     mail = '';
//     condPago = '';
//     agenciaId = 0;
//     nombreAgencia = '';
//   }
// }
