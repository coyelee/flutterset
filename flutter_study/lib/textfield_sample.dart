import 'package:flutter/material.dart';

class TextFieldSample extends StatefulWidget {

  TextFieldSample({Key key}): super(key:key);

  @override
  _TextFieldSampleState createState() => new _TextFieldSampleState();
}

class _TextFieldSampleState extends State<TextFieldSample> {

  final TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Field'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            controller: _controller,
            obscureText: true,
            decoration: new InputDecoration(
              hintText: 'Type something',
            ),
          ),
          new RaisedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => new AlertDialog(
                  title: new Text('What you typed'),
                  content: new Text(_controller.text),
                )
              );
            },
            child: new Text('DONE'),
          ),
        ],
      ),
    );
  }
}
