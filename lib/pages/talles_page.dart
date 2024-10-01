import 'package:flutter/material.dart';

class TallesPage extends StatefulWidget {
  @override
  _TallesPageState createState() => _TallesPageState();
}

class _TallesPageState extends State<TallesPage> {
  final List<String> talles = [
    'XS',
    'S',
    'M',
    'L',
    'XL',
    '2XL',
    '3XL',
  ];

  final List<String> disponibles = [
    '3',
    '7',
    '10',
    '92',
    '1',
    '0',
    '-1',
  ];

  final List<int> cantidad = [
    40,
    60,
    200,
    200,
    100,
    4,
    100,
  ];

  final ScrollController _tallesController = ScrollController();
  final ScrollController _disponiblesController = ScrollController();
  final ScrollController _cantidadController = ScrollController();

  @override
  void initState() {
    super.initState();

    _tallesController.addListener(() {
      if (_tallesController.offset != _disponiblesController.offset) {
        _disponiblesController.jumpTo(_tallesController.offset);
      }
      if (_tallesController.offset != _cantidadController.offset) {
        _cantidadController.jumpTo(_tallesController.offset);
      }
    });

    _disponiblesController.addListener(() {
      if (_disponiblesController.offset != _tallesController.offset) {
        _tallesController.jumpTo(_disponiblesController.offset);
      }
      if (_disponiblesController.offset != _cantidadController.offset) {
        _cantidadController.jumpTo(_disponiblesController.offset);
      }
    });

    _cantidadController.addListener(() {
      if (_cantidadController.offset != _tallesController.offset) {
        _tallesController.jumpTo(_cantidadController.offset);
      }
      if (_cantidadController.offset != _disponiblesController.offset) {
        _disponiblesController.jumpTo(_cantidadController.offset);
      }
    });
  }

  @override
  void dispose() {
    _tallesController.dispose();
    _disponiblesController.dispose();
    _cantidadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blueGrey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'AH-5838-Variante',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Talles', style: TextStyle(fontSize: 26)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ListView.separated(
                        controller: _tallesController,
                        itemCount: talles.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(talles[i]),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20), // Añadir espacio para asegurar visibilidad del VerticalDivider
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7, // Especificar altura para el VerticalDivider
                  child: VerticalDivider(
                    color: Colors.red,
                    thickness: 2,
                  ),
                ),
                SizedBox(width: 20), // Añadir espacio para asegurar visibilidad del VerticalDivider
                Column(
                  children: [
                    Text('Disponibles', style: TextStyle(fontSize: 26)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ListView.separated(
                        controller: _disponiblesController,
                        itemCount: disponibles.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(disponibles[i]),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7, // Especificar altura para el VerticalDivider
                  child: VerticalDivider(
                    color: Colors.red,
                    thickness: 2,
                  ),
                ),
                Column(
                  children: [
                    Text("Cantidad", style: TextStyle(fontSize: 26)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ListView.separated(
                        controller: _cantidadController,
                        itemCount: cantidad.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(cantidad[i].toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: (){
                                    cantidad[i] --;
                                    setState(() {});
                                  }, 
                                  icon: Icon(Icons.remove)
                                ),
                                IconButton(
                                  onPressed: (){
                                    cantidad[i] ++;
                                    setState(() {});
                                  }, 
                                  icon: Icon(Icons.add)
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
