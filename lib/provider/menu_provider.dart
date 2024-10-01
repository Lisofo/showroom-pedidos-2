import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MenuProvider with ChangeNotifier {
  List<dynamic> opciones = [];
  List<dynamic> opcionesRevision = [];

  MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];

    return opciones;
  }

  Future<List<dynamic>> cargarMenuRevision(String codTipoOrden) async {
    final resp = await rootBundle.loadString('data/menu_revision.json');

    Map dataMap = json.decode(resp);
    opcionesRevision = dataMap['rutas'];
    return opcionesRevision.where((menu) => menu['tipoOrden'].toString().contains(codTipoOrden)).toList();
  }

  String _menu = '';
  String get menu => _menu;

  void setPage(String codPages) {
    _menu = codPages;
    notifyListeners();
  }
}

final menuProvider = MenuProvider();
