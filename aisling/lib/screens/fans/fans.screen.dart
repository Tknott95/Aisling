import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aisling/widgets/fans/fans.widget.dart';


Future<String> testThis() async {
  await Future.delayed(Duration(seconds: 1));

  return "tested";
}


class FansScreen extends StatelessWidget {
  const FansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: testThis(), 
              /*fetchFansData(0)*/
              builder: (BuildContext context, AsyncSnapshot<String> text) {
                if (text.connectionState == ConnectionState.waiting) {
                  return new Text('loading data..');
                   // new Text(text.data!);
                } else return new Text(text.data!.toString());
              }
            ),
            SliderWidgetFans(gpuIndex: 0),
            SizedBox(height: 50),
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
