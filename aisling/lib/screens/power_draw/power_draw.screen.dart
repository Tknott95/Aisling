import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

import 'package:aisling/widgets/power_draw/power_draw.widget.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchPowerDrawData(int _gpuIndex) async {
  /* I use GET instead of POST with auth */
  // Map<String, String> myHeaders = Map<String, String>();
  // myHeaders ['alice'] = 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>';

  print("\n fetchFansData($_gpuIndex)");
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'alice': 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>'
  };

  final backendURL = Uri.parse('http://192.168.0.8:8080/api/get/powerDraw');

  http.Response response = await http.get(backendURL, headers: requestHeaders);
 
  /* @TODO - build models to consume for code instantiation */
  print(response.body);
  print(json.decode(response.body));
  print(json.decode(response.body)['gpuTemp']);
  print(json.decode(response.body)['gpuTemp'][_gpuIndex]['gpuVal']);
  // print(json.decode(response.body)['fans'][1]['gpuVal']);

  int _powerDrawVal = int.parse(json.decode(response.body)['gpuTemp'][_gpuIndex]['gpuVal']);

  // return "$fanSpeed";
  return "${_powerDrawVal}W";
}

class PowerDrawScreen extends StatelessWidget {
  const PowerDrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "POWER DRAW",
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
                  future: fetchPowerDrawData(0), 
                  /*fetchFansData(0)*/
                  builder: (BuildContext context, AsyncSnapshot<String> text) {
                    if (text.connectionState == ConnectionState.waiting) {
                      return new Text('loading data..');
                      // new Text(text.data!);
                    } else return new Text(
                      text.data!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 3, fontSize: 30 
                        )
                      );
                  }
                ),
                SizedBox(width: 50),
                FutureBuilder(
                  future: fetchPowerDrawData(1), 
                  /*fetchFansData(0)*/
                  builder: (BuildContext context, AsyncSnapshot<String> text) {
                    if (text.connectionState == ConnectionState.waiting) {
                      return new Text('loading data..');
                      // new Text(text.data!);
                    } else return new Text(
                      text.data!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 3, fontSize: 30 
                        )
                      );
                  }
                ),
               ]
             ),
            SliderWidgetPowerDraw(gpuIndex: 0),
            SizedBox(width: 5),
            SliderWidgetPowerDraw(gpuIndex: 1),
          ]
        ) 
      );
  }
}
