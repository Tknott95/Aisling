import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aisling/widgets/fans/fans.widget.dart';

class FansScreen extends StatelessWidget {
  const FansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SliderWidgetFans(gpuIndex: 0),
            SizedBox(width: 5),
            SliderWidgetFans(gpuIndex: 1),
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
