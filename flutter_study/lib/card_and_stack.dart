//link:https://github.com/flutter/website/tree/master/examples/layout/card_and_stack

import 'package:flutter/material.dart';

class FStackAndCard extends StatelessWidget {
  static final showCard = true; // Set to false to show Stack
  //static final showCard = false; // Set to false to show Stack

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack and Card'),
      ),
      body: showCard ? _buildCard() : _buildStack(),
    );
  }

  Widget _buildCard() => SizedBox(
    height: 224.0,
    child: Card(
      elevation: 24,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('1625 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('My City, CA 99984'),
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          Divider(),
          ListTile(
            title: Text('(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500)),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.blue[500],
            ),
          ),
          Divider(),
          ListTile(
            title: Text('costa@example.com'),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.blue[500],
            ),
          )
        ],
      ),
    ),
  );

  Widget _buildStack() => Stack(
    alignment: const Alignment(0.0, 0.0),
    children: <Widget>[
      new CircleAvatar(
        backgroundImage: new AssetImage('images/pic1.jpg'),
        radius: 100.0,
      ),
      new Container(
        padding: EdgeInsets.all(5),
          decoration: new BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: new Text(
            'Mia B',
            style: new TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
      ),
    ],
  );
}