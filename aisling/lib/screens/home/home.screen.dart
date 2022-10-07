import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:aisling/widgets/analytics/mining_analytics.widget.dart';

/* THIS WILL DISPLAY ANALYTICS */
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            MiningAnalyWidget(),
            // SliderWidgetGraphics(gpuIndex: 0),
            // SizedBox(height: 50),
            // SliderWidgetGraphics(gpuIndex: 1),
            Text("THIS WILL BE THE ANALYTICS HOME DASHBOARD"),
          //   ElevatedButton(
          //   // Within the `FirstScreen` widget
          //   onPressed: () {
          //       // Navigate to the second screen using a named route.
          //       context.goNamed('power-draw');
          //   },
          //   child: const Text('edit power draw'),
          // ),
          ]
        )
        
      );
  }
}
