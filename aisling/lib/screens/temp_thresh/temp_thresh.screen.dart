import 'package:flutter/material.dart';

import 'package:aisling/widgets/temp_thresh/temp_thresh.widget.dart';

class TempThreshScreen extends StatelessWidget {
  const TempThreshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'temp of each will be shown here',
              style: Theme.of(context).textTheme.titleSmall
            ),
            SliderWidgetTempThresh(gpuIndex: 0),
            SizedBox(height: 5),
            SliderWidgetTempThresh(gpuIndex: 1),
          ]
        ) 
      );
  }
}
