import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:aisling/models/lolminer.model.dart' as lm;
import 'package:flutter_spinkit/flutter_spinkit.dart';

bool runningOffline = true;

class MiningAnalyWidget extends StatefulWidget {
  const MiningAnalyWidget({Key? key}) : super(key: key);

  @override
  _MiningAnalyWidgetState createState() {
    return _MiningAnalyWidgetState();
  }
}

// @TODO modularize this
class _MiningAnalyWidgetState extends State<MiningAnalyWidget> {
  final StreamController<lm.Lolminer> _streamCtrl = StreamController();


  @override
  void dispose() {
    _streamCtrl.close();
  }

  @override
  void initState() {


    Timer mytimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      runningOffline ? _fetchLolMiningData() : _makeMockMiningData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<lm.Lolminer>(
      stream: _streamCtrl.stream,
      builder: (context, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.waiting: return Center(child: Column(
            children: [
              Text(
                'WAITING FOR MINING TO BEGIN -  START AT YOUR REMOTE LOCATION TO UNLOCK',
                style: Theme.of(context).textTheme.headline3
              ),
              Text(
                'building a way to start miner from here next!',
                // style: Theme.of(context).textTheme.headline3
              ),
               SpinKitDancingSquare(
                size: 100,
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? const Color.fromARGB(255, 179, 179, 179) : const Color.fromARGB(255, 220, 220, 219),
                    ),
                  );
                },
              ),
            ],
          ));
          default: if(snapshot.hasError){
            return Text(
              'Waiting for mining server...', style: Theme.of(context).textTheme.headline1);
          } else {
            return analyticsWidget(snapshot.data!);
          }
        }
      }
    );
  }
            // return Text(snapshot.data.software, style: Theme.of(context).textTheme.headline1);

  Widget analyticsWidget(lm.Lolminer _minerModel) {
    return Column(
      children: [
        /* Make a col of workers inside an if state @TODO */

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Total Hash Rate:     ${_minerModel.algorithms![0].totalPerformance.toStringAsFixed(3)}Mh/s", style: Theme.of(context).textTheme.headline6),
            Text("Accepted Shares:     ${_minerModel.algorithms![0].totalAccepted}", style: Theme.of(context).textTheme.headline6),
            Text("Rejected Shares:     ${_minerModel.algorithms![0].totalRejected}", style: Theme.of(context).textTheme.headline6),
            Text("Total Stales:     ${_minerModel.algorithms![0].totalStales}", style: Theme.of(context).textTheme.headline6),
          ]
        ),
        const Divider(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           for(var ijk in _minerModel.workers!) ...[
              const Divider(),
              Text("Workers: ${ijk.name}", style: Theme.of(context).textTheme.bodyMedium),
              Text("Power: ${ijk.power}W", style: Theme.of(context).textTheme.bodySmall),
              Text("LHR Unlock: ${ijk.lhrUnlockPct}%", style: Theme.of(context).textTheme.bodySmall),
              const Divider(),
              Text("CCLK: ${ijk.cclk}", style: Theme.of(context).textTheme.bodySmall),
              Text("MCLK: ${ijk.mclk}W", style: Theme.of(context).textTheme.bodySmall),
              Text("CORE_TEMP: ${ijk.coreTemp}%", style: Theme.of(context).textTheme.bodySmall),
            ],
          ],
        ),
        // const Divider(),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //  for(var ijk in _minerModel.workers!) ...[
        //       Text("CCLK: ${ijk.cclk}", style: Theme.of(context).textTheme.bodySmall),
        //       Text("MCLK: ${ijk.mclk}W", style: Theme.of(context).textTheme.bodySmall),
        //       Text("CORE_TEMP: ${ijk.coreTemp}%", style: Theme.of(context).textTheme.bodySmall),
        //     ],
        //   ],
        // ),
        const Divider(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Software:     ${_minerModel.software}", style: Theme.of(context).textTheme.bodySmall),
            Text("POOL:      ${_minerModel.algorithms![0].pool}s", style: Theme.of(context).textTheme.bodySmall),
            Text("UPTIME:      ${_minerModel.session!.uptime}s", style: Theme.of(context).textTheme.bodySmall),
            Text("# of workers: ${_minerModel.numWorkers}" , style: Theme.of(context).textTheme.bodySmall),
            // Text("Workers:      ${_minerModel.workers}", style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
        const Divider(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text("Accepted Shares:     ${_minerModel.algorithms![0].totalAccepted}", style: Theme.of(context).textTheme.headlineSmall),
            // Text("Rejected Shares:     ${_minerModel.algorithms![0].totalRejected}", style: Theme.of(context).textTheme.headlineSmall),
            // Text("Total Hash Rate:     ${_minerModel.algorithms![0].totalPerformance}", style: Theme.of(context).textTheme.headlineSmall),
            Text("Uptime:     ${_minerModel.session!.uptime}", style: Theme.of(context).textTheme.bodySmall),
            Text("Wallet Mining Into:     ${_minerModel.algorithms![0].user}", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const Divider(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Algorithm:     ${_minerModel.algorithms![0].algorithm}", style: Theme.of(context).textTheme.bodySmall),
            Text("Hash Rate:     ${_minerModel.algorithms![0].workerPerformance}Mh/s", style: Theme.of(context).textTheme.bodySmall),

            Text("STARTUP:      ${_minerModel.session!.startup}", style: Theme.of(context).textTheme.bodySmall),
            Text("last update: ${_minerModel.session!.lastUpdate}" , style: Theme.of(context).textTheme.bodySmall),
            // Text("Workers:      ${_minerModel.workers}", style: Theme.of(context).textTheme.bodySmall)
          ],
        ),



      ],
    );
  } 

  /* @TODO set tto var of type in initState then run a timer and only call var names on type. Set type every time and just run functional code patterns instead of a stream */
  Future<void> _fetchLolMiningData() async {
    var _url =
        Uri.parse('http://10.0.2.2:1339'); /* try this with 192 ip instead and then hook into aisling */
    try {
      var response = await http.get(_url);
      print('Response status: ${response.statusCode}');

      final miningData = lm.Lolminer.fromJson(json.decode(response.body));

      print(json.decode(response.body));

      print(miningData);

      _streamCtrl.sink.add(miningData);

      // final parsedTrans = transactionsFromJson(_jsonBody);
      print('#########     ${miningData.session?.uptime}    /   ${miningData.session?.lastUpdate} ####');
      print('#########     ${miningData.software}    /    ${miningData.numWorkers} ##############');
      print('Response status: ${response.statusCode}');

      // return miningData;
    } catch (e) {
      print(e);
    }
  }

  Future<void> _makeMockMiningData() async {
    /* waiting two seconds to return the mockData to emulatre an actual api */
    await Future.delayed(const Duration(seconds: 2));


    lm.Worker _mockWorker00 = lm.Worker(
      index: 0,
      name: "worker name",
      power: 173.37,
      cclk: 10,
      mclk: 73,
      coreTemp: 73,
      jucTemp: 17,
      memTemp: 77,
      fanSpeed: 44,
      lhrUnlockPct: 100,
      dualFactor: 13,
      pcieAddress: "0:0:0"
    );

    lm.Session _lolMinerSession = lm.Session(
      startup: 137,
      startupString: "lorem ipsum",
      uptime: 10,
      lastUpdate: 731137
    );

    lm.Algorithm _mockAlgorithm = lm.Algorithm(
      algorithm: 'autolykos',
      algorithmAppendix:  '1337kos',
      pool: 'us-2miners-ipsum',
      user: 'x137',
      worker: 'addr8043843hsdfdsf8o3u',
      performanceUnit: "1337 unit",
      performanceFactor: 1,
      totalPerformance: 153.71,
      totalAccepted: 10,
      totalRejected: 0,
      totalStales: 0,
      totalErrors: 0,
      workerPerformance: [

      ],
      workerAccepted: [

      ],
      workerRejected: [

      ],
      workerStales: [

      ],
      workerErrors: [

      ]
    );

    lm.Lolminer _mockMinerModel = lm.Lolminer(
      software: "software lorem ipsum",
      session: _lolMinerSession,
      numWorkers: 2,
      workers: [
        _mockWorker00,
        _mockWorker00,
      ],
      numAlgorithms: 1,
      algorithms: [
        _mockAlgorithm,
      ]
    );
    // _mockMinerModel = 

  }
}

