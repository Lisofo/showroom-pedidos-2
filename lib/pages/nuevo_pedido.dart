// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:showroom_maqueta/rutas/routes.dart';

class NuevoPedido extends StatefulWidget {
  @override
  State<NuevoPedido> createState() => _NuevoPedidoState();
}

class _NuevoPedidoState extends State<NuevoPedido> {
// descuento
  String _fecha = '';
  TextEditingController _inputFieldDateController = new TextEditingController();
  String _fechaVencimiento = '';
  TextEditingController _inputFieldDateControllerVencimiento = new TextEditingController();
  List<String> _opcionesMoneda = ['U\$S', 'UYU'];
  String _opcionSeleccionada = 'UYU';

  List<DropdownMenuItem<String>> getOpcionesDropdown(){

    List<DropdownMenuItem<String>> lista = [];

    _opcionesMoneda.forEach((moneda){
      lista.add(DropdownMenuItem(
        child: Text(moneda),
        value: moneda,
      ));
    });
    return lista;
  }
  List<String> _opcionesTipo = ['Contado','Credito', 'Remito'];
  String _opcionTipo = 'Contado';

  List<DropdownMenuItem<String>> getOpcionesDropdownTipo(){

    List<DropdownMenuItem<String>> lista = [];

    _opcionesTipo.forEach((tipo){
      lista.add(DropdownMenuItem(
        child: Text(tipo),
        value: tipo,
      ));
    });
    return lista;
  }


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Nuevo Pedido'),
      elevation: 0,
      backgroundColor: Color(0xFFFD725A),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pedido: ',
                      style: TextStyle(fontSize: 24),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        initialValue: '2023V.86.1',
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Fecha: ',
                      style: TextStyle(fontSize: 24),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: _crearFecha(context),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Fecha de Vencimiento: ',
                      style: TextStyle(fontSize: 24),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: _crearFechaVencimiento(context),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Descripcion: ',
                      style: TextStyle(fontSize: 24),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: 'Ingrese Descripcion',
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Moneda:', style: TextStyle(fontSize: 24)),
                        SizedBox(width: 30,),
                        DropdownButton(
                          value: _opcionSeleccionada,
                          items: getOpcionesDropdown(),
                          onChanged: (opt) {
                            setState(() {
                              _opcionSeleccionada = opt!;
                            });
                          },
                        ),
                        Text('Tipo:', style: TextStyle(fontSize: 24)),
                        SizedBox(width: 30,),
                        DropdownButton(
                          value: _opcionTipo,
                          items: getOpcionesDropdownTipo(),
                          onChanged: (opt) {
                            setState(() {
                              _opcionTipo = opt!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text('Descuento: ', style: TextStyle(fontSize: 24)),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        decoration: InputDecoration(),
                      ),
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
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'Agregar',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {      
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Pedido: ',
                          style: TextStyle(fontSize: 24),
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            initialValue: '2023V.86.1',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text(
                          'Fecha: ',
                          style: TextStyle(fontSize: 24),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: _crearFecha(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text(
                          'Fecha de Vencimiento: ',
                          style: TextStyle(fontSize: 24),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: _crearFechaVencimiento(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Descripcion: ',
                          style: TextStyle(fontSize: 24),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: 'Ingrese Descripcion',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Moneda:', style: TextStyle(fontSize: 24)),
                        SizedBox(width: 30,),
                        DropdownButton(
                          value: _opcionSeleccionada,
                          items: getOpcionesDropdown(),
                          onChanged: (opt) {
                            setState(() {
                              _opcionSeleccionada = opt!;
                            });
                          },
                        ),
                        SizedBox(width: 30),
                        Text('Tipo:', style: TextStyle(fontSize: 24)),
                        SizedBox(width: 30,),
                        DropdownButton(
                          value: _opcionTipo,
                          items: getOpcionesDropdownTipo(),
                          onChanged: (opt) {
                            setState(() {
                              _opcionTipo = opt!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Descuento: ', style: TextStyle(fontSize: 24)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: TextField(
                            decoration: InputDecoration(),
                          ),
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
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'Agregar',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    ),
  );
}


  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        hintText: 'Fecha de Compra',
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selecDate(context);
      },
    );
  }

  _selecDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2090),
        locale: Locale('es', 'UY'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  Widget _crearFechaVencimiento(BuildContext context) {
    return TextField(
      controller: _inputFieldDateControllerVencimiento,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        hintText: 'Fecha de Vencimiento',
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selecDateVencimiento(context);
      },
    );
  }

  _selecDateVencimiento(BuildContext context) async {
    DateTime? pickedVencimiento = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2090),
      locale: Locale('es', 'UY')
    );
    if (pickedVencimiento != null) {
      setState(() {
        _fechaVencimiento = pickedVencimiento.toString();
        _inputFieldDateControllerVencimiento.text = _fechaVencimiento;
      });
    }
  }
}
