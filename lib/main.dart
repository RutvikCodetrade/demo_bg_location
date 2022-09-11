import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:workmanager/workmanager.dart';

import 'background_service/background_service.dart';
import 'foreground_task/foreground_task.dart';

/*
*  TODO : 1. test with foreground service
*         2. Use Work manager
* */

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Workmanager().initialize(
  //   callbackDispatcher,
  //   isInDebugMode: true,
  // );
  initializeService();
  runApp(MyApp());
}

const simplePeriodicTask =
    "be.tramckrijte.workmanagerExample.simplePeriodicTask";

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     switch (task) {
//       case simplePeriodicTask:
//         Position position = await Geolocator.getCurrentPosition(
//             desiredAccuracy: LocationAccuracy.high);
//         await fetchAlbum();
//         print("Work Manager : User Position ${position.latitude} ${position.longitude}");
//         break;
//       case Workmanager.iOSBackgroundTask:
//         print("The iOS background fetch was triggered");
//         Directory? tempDir = await getTemporaryDirectory();
//         String? tempPath = tempDir.path;
//         print(
//             "You can access other plugins in the background, for example Directory.getTemporaryDirectory(): $tempPath");
//         break;
//     }
//
//     return Future.value(true);
//   });
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late FlutterBackgroundService service;

  @override
  void initState() {
    service = FlutterBackgroundService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter WorkManager Example"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 16),
                //This task runs periodically
                //It will wait at least 10 seconds before its first launch
                //Since we have not provided a frequency it will be the default 15 minutes
                ElevatedButton(
                    onPressed: Platform.isAndroid
                        ? () {
                      print("Service Button Clicked");
                      service.startService();
                    }
                        : null,
                    child: const Text("Start Service")),
                const SizedBox(height: 16),
                //This task runs periodically
                //It will wait at least 10 seconds before its first launch
                //Since we have not provided a frequency it will be the default 15 minutes
                ElevatedButton(
                    onPressed: Platform.isAndroid
                        ? () {
                            print("CaLLED");
                            Workmanager().registerPeriodicTask(
                              simplePeriodicTask,
                              simplePeriodicTask,
                              frequency: const Duration(minutes: 15),
                            );
                          }
                        : null,
                    child: const Text("Register Periodic Task (Android)")),
                Text(
                  "Task cancellation",
                  style: Theme.of(context).textTheme.headline5,
                ),
                ElevatedButton(
                  child: const Text("Cancel All"),
                  onPressed: () async {
                    await Workmanager().cancelAll();
                    print('Cancel all tasks completed');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
