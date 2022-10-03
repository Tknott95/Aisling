import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

import 'package:aisling/widgets/power_draw/power_draw.widget.dart';

class PowerDrawScreen extends StatelessWidget {
  const PowerDrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SliderWidgetPowerDraw(gpuIndex: 0),
            SizedBox(width: 5),
            SliderWidgetPowerDraw(gpuIndex: 1),
          ]
        ) 
      );
  }
}
