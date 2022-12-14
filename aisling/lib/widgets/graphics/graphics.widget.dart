import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

Future<void> setGraphicsClockFetch(int _gpuIndex, int _val) async {
  /* I use GET instead of POST with auth */
  // Map<String, String> myHeaders = Map<String, String>();
  // myHeaders ['alice'] = 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>';

   print("\n SETTING GRAPHICS CLOCK");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'alice': 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>'
  };

  final backendURL = Uri.parse('http://192.168.0.8:8080/api/setGraphicsClock/$_gpuIndex/$_val');

 http.Response response = await http.get(backendURL, headers: requestHeaders);
 print(response.body);
}

/* @TODO - copy this function above to fans and then change such for graphics */

class SliderWidgetGraphics extends StatefulWidget {
  final gpuIndex;
  const SliderWidgetGraphics({Key? key, @required this.gpuIndex}) : super(key: key);

  @override
  State<SliderWidgetGraphics> createState() => _SliderWidgetStateGraphics();
}

class _SliderWidgetStateGraphics extends State<SliderWidgetGraphics> {
  var gpuIndex;
  @override
  void initState() {
    gpuIndex = widget.gpuIndex;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          'GPU_$gpuIndex GRAPHICS',
          style: Theme.of(context).textTheme.headline6,
          ),
        SleekCircularSlider(
          min: 0,
          max: 80,
          initialValue: 5,
          innerWidget: (sliderValue) => Center(
            child: Text(
                "+${sliderValue.toStringAsFixed(0)}",
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
            setGraphicsClockFetch(gpuIndex, value.round());
          }
        ),
      ],
    );
  }
}