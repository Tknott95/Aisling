import 'package:flutter/material.dart';

import 'package:aisling/widgets/graphics/graphics.widget.dart';
import 'package:aisling/widgets/bottom-bar/bottom-bar.widget.dart';

import 'dart:core';

import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';

import 'package:go_router/go_router.dart';


/* this bottom_navigation_bar wont let me over-modularize. Need to pull it back out */

enum CurrentScreen {
 graphics, fans
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CurrentScreen currentScreen = CurrentScreen.fans;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
    //   appBar: AppBar(
    //     // Here we take the value from the MyHomePage object that was created by
    //     // the App.build method, and use it to set our appbar title.
    //     title: Text(widget.title),
    //   ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SliderWidgetGraphics(gpuIndex: 0),
            SizedBox(width: 5),
            SliderWidgetGraphics(gpuIndex: 1),
            Center(
        child: ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: () {
            // Navigate to the second screen using a named route.
            GoRouter.of(context).go('/graphics');
          },
          child: const Text('graphics'),
        ),
      ),
            // // const Text(
            // //   'hehehehehehehehe',
            // // ),
            // // Text(
            // //   'Set Clocks',
            // //   style: Theme.of(context).textTheme.headline4,
            // // ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children:  [
            //     ElevatedButton(
            //       // Within the `FirstScreen` widget
            //       onPressed: () {
            //         // Navigate to the second screen using a named route.
            //         this.currentScreen = CurrentScreen.graphics;
            //         // Navigator.pushNamed(context, '/graphics');
            //       },
            //       child: const Text('Launch screen'),
            //     ),
                
            //       SliderWidgetGraphics(gpuIndex: 0),
            //       SizedBox(width: 5),
            //       SliderWidgetGraphics(gpuIndex: 1),

            //     // switch(this.widget.currentScreen) { 
            //     //     case widget.CurrentScreen.graphics: { 
            //     //         SliderWidgetGraphics(gpuIndex: 0),
            //     //         SizedBox(width: 5),
            //     //         SliderWidgetGraphics(gpuIndex: 1),
            //     //         break;
            //     //     } 

            //     //     default: { 
            //     //         Text('home')
            //     //         break; 
            //     //     }
            //     // }
            //     // if(this.currentScreen == CurrentScreen.graphics) ...[
            //     //   SliderWidgetGraphics(gpuIndex: 0),
            //     //   SizedBox(width: 5),
            //     //   SliderWidgetGraphics(gpuIndex: 1),
            //     // ]
            //     //  else ...[
            //     //   Text('home')
            //     // ]
            //   ],
           
            // ),
          ],

        ),
      ),
      backgroundColor: const Color.fromRGBO(254,241,214, 1),
      bottomNavigationBar: BottomBarWithSheet(
        autoClose: false,
        sheetChild: Column(
          children: [
            SliderWidgetGraphics(gpuIndex: 0),
            SizedBox(width: 5),
            SliderWidgetGraphics(gpuIndex: 1),
          ]
        ),
        // Center(
        //   child: Text(
        //     "Another content",
        //     style: TextStyle(
        //       color: Colors.grey[600],
        //       fontSize: 20,
        //       fontWeight: FontWeight.w900,
        //     ),
        //   ),
        // ),
        bottomBarTheme: BottomBarTheme(
          height: 70,
          heightClosed: 70,
          heightOpened: 300,
          mainButtonPosition: MainButtonPosition.left,
          selectedItemIconColor: Colors.green,
          itemIconColor: Colors.white,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
            ),
          ),
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          size: 55,
          color: Colors.green,
          splash: Colors.green[800],
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
        items: const [
          BottomBarWithSheetItem(icon: Icons.home_rounded),
          BottomBarWithSheetItem(icon: Icons.shopping_cart),
          BottomBarWithSheetItem(icon: Icons.settings),
          BottomBarWithSheetItem(icon: Icons.favorite),
          BottomBarWithSheetItem(icon: Icons.donut_large),
          BottomBarWithSheetItem(icon: Icons.bar_chart_sharp),
          BottomBarWithSheetItem(icon: Icons.backup_rounded),
          BottomBarWithSheetItem(icon: Icons.camera_alt),
        ],
      )

    );

  }
}
