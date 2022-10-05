import 'package:flutter/material.dart';

import 'package:aisling/screens/home/home.screen.dart';
import 'package:aisling/wrappers/navigation/navigation.wrapper.dart';
import 'package:aisling/screens/graphics/graphics.screen.dart';
import 'package:aisling/screens/memory/memory_clocking.screen.dart';

import 'package:aisling/screens/fans/fans.screen.dart';
import 'package:aisling/screens/power_draw/power_draw.screen.dart';
import 'package:aisling/screens/temp_thresh/temp_thresh.screen.dart';
import 'package:aisling/screens/home/home.screen.dart';


import 'package:go_router/go_router.dart';


import 'dart:async';

/* @TODO refactor this http code */
/* finish apis */
/* create an actual archi here */
/* prob just tabs for now */

final GlobalKey<NavigatorState> _rootNavigatorKey =
 GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

void main() {
  runApp(MyApp());

  // setFansFetch();
  // Map<String, String> myHeaders = Map<String, String>();
  // myHeaders ['alice'] = 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>';
  // final ijk = Uri.parse('http://localhost:8080/api/setFans/0/50');
  // var response = http.get(ijk);  // print(x);
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // final GoRouter _router = GoRouter(
  //   routes: <GoRoute>[
      // GoRoute(
      //   path: '/',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const GraphicsScreen();
      //   },
      //   routes: <GoRoute>[
      //     GoRoute(
      //       path: '/graphics',
      //       builder: (BuildContext context, GoRouterState state) => 
      //         GraphicsScreen(),
      //     ),
      //   ],
      // ),
  //   ],
  // );

  // final GlobalKey<NavigatorState> _rootNavigatorKey =
  //   GlobalKey<NavigatorState>();

  /* ICONS - https://fonts.google.com/icons?selected=Material+Icons
  clocking - Thunderstorm ?
  temp - dew_point
  misc - severe_cold
  fans - cyclone - ac_unit
  graphics - auto_awesome
  memory clock - memory - sd_storage
  clocking type - electric_bolt
  */

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/graphicsClock',
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return NavigationWrapper(child: child, title: 'Home Screen');
        },
        routes: <RouteBase> [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/graphicsClock',
            name: 'graphicsClock',
            builder: (BuildContext context, GoRouterState state) => const GraphicsScreen(),
          ),
          GoRoute(
            path: '/memoryClock',
            name: 'memoryClock',
            builder: (BuildContext context, GoRouterState state) => const MemoryClockingScreen(),
          ),
          GoRoute(
           path: '/fans',
           name: 'fans',
           builder: (BuildContext context, GoRouterState state) => FansScreen(),
          ),
          GoRoute(
            path: '/power-draw',
            name: 'power-draw',
            builder: (BuildContext context, GoRouterState state) => const PowerDrawScreen(),
          ),
          GoRoute(
           path: '/temp-thresh',
           name: 'temp-thresh',
           builder: (BuildContext context, GoRouterState state) => const TempThreshScreen(),
          ),

            // routes: <RouteBase>[
            //   GoRoute(          
            //     parentNavigatorKey: _rootNavigatorKey,
            //     name: 'graphics',
            //     path: 'graphics',
            //     builder: (BuildContext context, GoRouterState state) {
            //       return const GraphicsScreen();
            //     },
            //   ),
            // ]
          //),
        ]
      )
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
      // routerConfig: _router,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'AISLING',
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const MyHomePage(title: 'the mobile mining ctrl'),
      //   '/graphics': (context) => const GraphicsScreen(/*title: 'graphics'*/),
      // },
      /* ROUTES ARE UGLY WHEN THEY SWITCH SCREEN */
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: HomeScreen(title: 'the mobile mining ctrl'),
    );


  
}
