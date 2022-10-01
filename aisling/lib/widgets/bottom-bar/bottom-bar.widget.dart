

import 'package:flutter/material.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';



/* @TODO - copy this function above to fans and then change such for graphics */

class BottomBarWidget extends StatefulWidget {
  final gpuIndex;
  const BottomBarWidget({Key? key, @required this.gpuIndex}) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
//   final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Riggy smells",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    //   bottomNavigationBar: BottomBarWithSheet(
    //     autoClose: false,
    //     sheetChild: Center(
    //       child: Text(
    //         "Another content",
    //         style: TextStyle(
    //           color: Colors.grey[600],
    //           fontSize: 20,
    //           fontWeight: FontWeight.w900,
    //         ),
    //       ),
    //     ),
    //     bottomBarTheme: BottomBarTheme(
    //       height: 70,
    //       heightClosed: 70,
    //       heightOpened: 300,
    //       mainButtonPosition: MainButtonPosition.left,
    //       selectedItemIconColor: Colors.green,
    //       itemIconColor: Colors.white,
    //       decoration: BoxDecoration(
    //         color: Colors.grey[900],
    //         borderRadius: const BorderRadius.only(
    //           topLeft: Radius.circular(30.0),
    //         ),
    //       ),
    //     ),
    //     mainActionButtonTheme: MainActionButtonTheme(
    //       size: 55,
    //       color: Colors.green,
    //       splash: Colors.green[800],
    //       icon: const Icon(
    //         Icons.add,
    //         color: Colors.white,
    //         size: 35,
    //       ),
    //     ),
    //     items: const [
    //       BottomBarWithSheetItem(icon: Icons.home_rounded),
    //       BottomBarWithSheetItem(icon: Icons.shopping_cart),
    //       BottomBarWithSheetItem(icon: Icons.settings),
    //       BottomBarWithSheetItem(icon: Icons.favorite),
    //       BottomBarWithSheetItem(icon: Icons.donut_large),
    //       BottomBarWithSheetItem(icon: Icons.bar_chart_sharp),
    //       BottomBarWithSheetItem(icon: Icons.backup_rounded),
    //       BottomBarWithSheetItem(icon: Icons.camera_alt),
    //     ],
    //   )
    );
  }
}