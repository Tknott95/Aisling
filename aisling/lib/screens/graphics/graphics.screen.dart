import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aisling/widgets/graphics/graphics.widget.dart';

class GraphicsScreen extends StatelessWidget {
  const GraphicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            SliderWidgetGraphics(gpuIndex: 0),
            SizedBox(width: 5),
            SliderWidgetGraphics(gpuIndex: 1),
          ]
        ) 
        // child: ElevatedButton(
        //   // Within the `FirstScreen` widget
        //   onPressed: () {
        //     // Navigate to the second screen using a named route.
        //     context.goNamed('b');
        //   },
        //   child: const Text('GRAPHICS screen'),
        // ),
      );
  }
}
