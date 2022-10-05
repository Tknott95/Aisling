import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aisling/widgets/graphics/graphics.widget.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;

Future<int> fetchGraphClockData(int _gpuIndex) async {
  /* I use GET instead of POST with auth */
  // Map<String, String> myHeaders = Map<String, String>();
  // myHeaders ['alice'] = 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>';

  print("\n fetchFansData($_gpuIndex)");
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'alice': 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>'
  };

  final backendURL = Uri.parse('http://192.168.0.8:8080/api/get/graphicsClock');

  http.Response response = await http.get(backendURL, headers: requestHeaders);
 
  /* @TODO - build models to consume for code instantiation */
  print(response.body);
  print(json.decode(response.body));
  print(json.decode(response.body)['graphicsClock']);
  print(json.decode(response.body)['graphicsClock'][_gpuIndex]['gpuVal']);

  int _graphClockVal = int.parse(json.decode(response.body)['graphicsClock'][_gpuIndex]['gpuVal']);

  return _graphClockVal;
}

class GraphicsScreen extends StatelessWidget {
  const GraphicsScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SliderWidgetGraphics(gpuIndex: 0),
            SizedBox(height: 50),
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
