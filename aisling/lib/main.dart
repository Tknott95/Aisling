import 'package:flutter/material.dart';

import 'package:aisling/screens/graphics/graphics.screen.dart';
import 'package:aisling/screens/home/home.screen.dart';


import 'dart:async';

/* @TODO refactor this http code */
/* finish apis */
/* create an actual archi here */
/* prob just tabs for now */


void main() {
  runApp(const MyApp());

  // setFansFetch();
  // Map<String, String> myHeaders = Map<String, String>();
  // myHeaders ['alice'] = 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>';
  // final ijk = Uri.parse('http://localhost:8080/api/setFans/0/50');
  // var response = http.get(ijk);  // print(x);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: HomeScreen(title: 'the mobile mining ctrl'),
    );
  }
}
