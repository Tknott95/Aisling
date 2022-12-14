import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aisling/widgets/graphics/graphics.widget.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;

/* need to modularize api calls so I can create a bool to pull from to set full app to offline emulated data vs actual reqs (non-gpu app dev work) */

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

Future<int> _mockGraphClockData() async {
  await Future.delayed(const Duration(seconds: 2));

  return 137;
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
            Text(
              "Graphics Clock",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 1, fontSize: 30 
              )
            ),
            /* pull these future builders into own widget */
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
         
                 FutureBuilder(
                  future: fetchGraphClockData(0), 
                  /*fetchFansData(0)*/
                  builder: (BuildContext context, AsyncSnapshot<int> text) {
                    if (text.connectionState == ConnectionState.waiting) {
                      return new Text('loading data..');
                      // new Text(text.data!);
                    } else return new Text(
                      "+"+text.data.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 3, fontSize: 30 
                        )
                      );
                  }
                ),
                SizedBox(width: 50),
                FutureBuilder(
                  future: fetchGraphClockData(1), 
                  /*fetchFansData(0)*/
                  builder: (BuildContext context, AsyncSnapshot<int> text) {
                    if (text.connectionState == ConnectionState.waiting) {
                      return new Text('loading data..');
                      // new Text(text.data!);
                    } else return new Text(
                      "+"+text.data.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 3, fontSize: 30 
                        )
                      );
                  }
                ),
               ]
             ),

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
