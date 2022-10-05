import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

Future<void> setFansFetch(int _gpuIndex, int _val) async {
  /* I use GET instead of POST with auth */
  // Map<String, String> myHeaders = Map<String, String>();
  // myHeaders ['alice'] = 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>';

   print("\n SETTING FANS");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'alice': 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>'
  };

  final backendURL = Uri.parse('http://192.168.0.8:8080/api/setFans/$_gpuIndex/$_val');

 http.Response response = await http.get(backendURL, headers: requestHeaders);
 print(response.body);
}

Future<String> fetchFansData(int _gpuIndex) async {
  /* I use GET instead of POST with auth */
  // Map<String, String> myHeaders = Map<String, String>();
  // myHeaders ['alice'] = 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>';

  print("\n fetchFansData($_gpuIndex)");
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'alice': 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>'
  };

  final backendURL = Uri.parse('http://192.168.0.8:8080/api/get/fanSpeed');

  http.Response response = await http.get(backendURL, headers: requestHeaders);
 
  /* @TODO - build models to consume for code instantiation */
  print(response.body);
  print(json.decode(response.body));
  print(json.decode(response.body)['fans']);
  print(json.decode(response.body)['fans'][_gpuIndex]['gpuVal']);
  // print(json.decode(response.body)['fans'][1]['gpuVal']);

  int fanSpeed = int.parse(json.decode(response.body)['fans'][_gpuIndex]['gpuVal']);

  return "$fanSpeed";
}

Future<String> testThis() async {
  await Future.delayed(Duration(seconds: 3));

  return "tested";
}



/* @TODO - copy this function above to fans and then change such for graphics */

class SliderWidgetFans extends StatefulWidget {
  final gpuIndex;
  const SliderWidgetFans({Key? key, @required this.gpuIndex}) : super(key: key);

  @override
  State<SliderWidgetFans> createState() => _SliderWidgetStateFans();
}

class _SliderWidgetStateFans extends State<SliderWidgetFans> {
  var gpuIndex;

  var d1;
  var d2;

  void fetchData() async {

    d1 = await fetchFansData(0);
    d2 = await fetchFansData(1);
  }



  
  @override
  void initState() {
    gpuIndex = widget.gpuIndex;

    fetchData();


    super.initState();
  }


 
  @override
  Widget build(BuildContext context) {
    return  Column(
              children: [
                FutureBuilder(
                  future: testThis(), 
                  /*fetchFansData(0)*/
                  builder: (context, AsyncSnapshot<String> text) {
                    if (text.data != null) {
                      return new Text(text.data!);
                    } else return new Text('backend api down');
                  }
                ),
                Text(
                  'GPU_$gpuIndex FANS ',
                  style: Theme.of(context).textTheme.headline6,
                  ),
                SleekCircularSlider(
                  min: 0,
                  max: 80,
                  initialValue: 5,
                  innerWidget: (sliderValue) => Center(
                    child: Text(
                        "+"+sliderValue.toStringAsFixed(0),
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ),
                  appearance: CircularSliderAppearance(
                    size: 155,
                    customWidths: CustomSliderWidths(
                      //handlerSize: 20,
                      trackWidth: 25,
                      //shadowWidth: 0,
                      progressBarWidth: 40,
                    ),
                    customColors: CustomSliderColors(
                      dotColor: const Color.fromARGB(175, 255, 255, 255)/*Theme.of(context).primaryColor*/,
                      trackColor: const Color.fromARGB(172, 0, 0, 0),
                      progressBarColors: const [
                      Color.fromARGB(255, 240, 40, 13),
                      Color.fromARGB(255, 238, 169, 20),
                      Color.fromARGB(255, 8, 63, 3),
                      Color.fromARGB(255, 50, 192, 45),
                      ],
                     shadowColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  onChange: (double value) {
                    // nvidia_set_graphics_clock(gpuIndex, value.round());
                    setFansFetch(gpuIndex, value.round());
                  }
                ),
              ],
            );
  }
}


