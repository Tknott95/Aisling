import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'dart:async';

/* @TODO refactor this http code */
import 'package:http/http.dart' as http;
  
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

void main() {
  runApp(const MyApp());

  setFansFetch();
  // Map<String, String> myHeaders = Map<String, String>();
  // myHeaders ['alice'] = 'top_secret_key<kdkljsdljkdsjklkljsdkjlsdkljsdjklsdjklkjlsdjksdkjlsdkjlklsjdkjlsdljk>';
  // final ijk = Uri.parse('http://localhost:8080/api/setFans/0/50');
  // var response = http.get(ijk);  // print(x);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'hehehehehehehehe',
            // ),
            // Text(
            //   'Set Clocks',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SliderWidgetGraphics(gpuIndex: 0),
                SizedBox(width: 5),
                SliderWidgetGraphics(gpuIndex: 1),
              ],
            ), 
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

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
                        "+"+sliderValue.toStringAsFixed(0),
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ),
                  appearance: CircularSliderAppearance(
                    size: 85,
                    customWidths: CustomSliderWidths(
                      //handlerSize: 20,
                      trackWidth: 1,
                      //shadowWidth: 0,
                      progressBarWidth: 11,
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