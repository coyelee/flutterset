import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutterbarinfoplugin/flutterbarinfoplugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  int _count = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    int count;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Flutterbarinfoplugin.platformVersion;
      //await Flutterbarinfoplugin.enterForum;
      List barPics = await Flutterbarinfoplugin.barPics;
      count = barPics.length;

      List barNames = await Flutterbarinfoplugin.barNames;
      count += barNames.length;

      List barDes = await Flutterbarinfoplugin.barDes;
      count += barDes.length;

      List barLevel = await Flutterbarinfoplugin.barLevels;
      count += barLevel.length;

    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _count = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_count\n'),
        ),
      ),
    );
  }
}
