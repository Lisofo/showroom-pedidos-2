import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:showroom_maqueta/pages/menu.dart';
import 'package:showroom_maqueta/pages/seleccion_origen.dart';
import 'package:showroom_maqueta/pages/talles_page.dart';
import 'package:showroom_maqueta/rutas/rebuild_notifier.dart';
import '../pages/agregar_a_pedido.dart';
import '../pages/buscador_cliente.dart';
import '../pages/login.dart';
import '../pages/nuevo_pedido.dart';
import '../pages/pagina_checkout.dart';
import '../pages/pagina_cliente.dart';
import '../pages/pedido_interno.dart';
import '../pages/product_page.dart';

// Map<String, WidgetBuilder> getApplicationRoutes() {
//   return <String, WidgetBuilder>{
//     '/': (BuildContext context) => Login(),
//     'origen' : (BuildContext context) => SeleccionOrigen(),
//     'buscadorCliente' : (BuildContext context) => BuscadorCliente(),
//     'paginaCliente': (BuildContext context) => PaginaCliente(),
//     'pedidoInterno' : (BuildContext context) => PedidoInterno(),
//     'agregarAPedido' : (BuildContext context) => AgregarPedido(),
//     'paginaProducto' : (BuildContext context) => ProductPage(),
//     'nuevoPedido' : (BuildContext context) => NuevoPedido(),
//     'checkout' : (BuildContext context) => PaginaCheckout(),
//   };
// }

final loginNav = GlobalKey<NavigatorState>();
final origenNav = GlobalKey<NavigatorState>();
final clientSearchNav = GlobalKey<NavigatorState>();
final menuNav = GlobalKey<NavigatorState>();

final rebuildNotifier = RebuildNotifier();

final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    //todo cuando funcion login
    // String token = context.read<OrdenProvider>().token;
    // if (token == '') {
    //   return '/';
    // }
    return null;
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => ValueListenableBuilder<bool>(
        valueListenable: rebuildNotifier,
        builder: (context, value, child) => child!,
        child: child,
      ),
      branches: [
        StatefulShellBranch(
          navigatorKey: loginNav,
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const Login(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: menuNav,
          routes: [
            GoRoute(
              path: '/menu',
              builder: (context, state) => const MenuPage(),
              routes: [
                GoRoute(
                  path: 'origen',
                  builder: (context, state) => SeleccionOrigen()
                )
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: clientSearchNav,
          routes: [
            GoRoute(
              path: '/buscadorCliente',
              builder: (context, state) => BuscadorCliente(),
              routes: [
                GoRoute(
                  path: 'paginaCliente',
                  builder: (context, state) => PaginaCliente(),
                  routes: [
                    GoRoute(
                      path: 'pedidoInterno',
                      builder: (context, state) => PedidoInterno(),
                      routes: [
                        GoRoute(
                          path: 'agregarAPedido',
                          builder: (context, state) => AgregarPedido(),
                          routes: [
                            GoRoute(
                              path: 'paginaProducto',
                              builder: (context, state) => ProductPage(),
                              routes: [
                                GoRoute(
                                  path: 'paginaTalles',
                                  builder: (context, state) => TallesPage()
                                )
                              ]
                            ),
                          ]
                        ),
                        GoRoute(
                          path: 'nuevoPedido',
                          builder: (context, state) => NuevoPedido(),
                        ),
                        GoRoute(
                          path: 'checkout',
                          builder: (context, state) => PaginaCheckout(),
                        ),
                        GoRoute(
                          path: 'paginaProducto',
                          builder: (context, state) => ProductPage(),
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'nuevoPedido',
                      builder: (context, state) => NuevoPedido(),
                    ),
                  ],
                ),
              ]
            ),
          ],
        ),
      ]
    )  
  ]
);