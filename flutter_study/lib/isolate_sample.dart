import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:isolate';


class IsolateSample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('isolate'),
      ),
      body: IsolateAppPage(),
    );
  }
}

class IsolateAppPage extends StatefulWidget {

  IsolateAppPage({Key key}) : super(key: key);

  @override
  _IsolatePageState createState() => new _IsolatePageState();
}

class _IsolatePageState extends State<IsolateAppPage> {

  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadata();
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }

    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Text("Row ${widgets[i]["body"]}"
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('isolate'),
      ),
      body: getBody(),
    );
  }

  void loadata()async {
      ReceivePort receivePort = new ReceivePort();
      await Isolate.spawn(dataLoader, receivePort.sendPort);

      // The 'echo' isolate sends it's SendPort as the first message
      SendPort sendPort = await receivePort.first;

      List msg = await sendReceive(sendPort, "https://jsonplaceholder.typicode.com/posts");

      setState(() {
        widgets = msg;
      });
  }

  // the entry point for the isolate
  static dataLoader(SendPort sendPort) async {
    // Open the ReceivePort for incoming messages.
    ReceivePort port = new ReceivePort();

    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);

    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataURL = data;
      http.Response response = await http.get(dataURL);
      // Lots of JSON to parse
      replyTo.send(jsonDecode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
}