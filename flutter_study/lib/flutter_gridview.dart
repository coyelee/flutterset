//地址 :https://github.com/flutter/website/tree/master/examples/layout/grid_and_list

import 'package:flutter/material.dart';

class FlutterGridViewAndListView extends StatelessWidget {

  //static final showGrid = true; // Set to false to show ListView
  static final showGrid = false; // Set to false to show ListView

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView / ListView'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
              }
          ),
        ],
      ),
      body: Center(
        child: showGrid ? _buildGrid() : _buildList(),
      ),
    );
  }

  Widget _buildGrid() =>GridView.extent(
    maxCrossAxisExtent: 150,
    padding: EdgeInsets.all(4.0),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileList(30),
  );

  List<Container>_buildGridTileList(int count) =>List.generate(
      count,
      (i) => Container(
        child: Image.asset('images/pic1.jpg'),
      ),
  );

  Widget _buildList() => ListView(
    children: <Widget>[
      _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
      _tile('The Castro Theater', '429 Castro St', Icons.theaters),
      _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
      _tile('Roxie Theater', '3117 16th St', Icons.theaters),
      _tile('United Artists Stonestown Twin', '501 Buckingham Way',
          Icons.theaters),
      _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
      Divider(),
      _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
      _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
      _tile(
          'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
      _tile('La Ciccia', '291 30th St', Icons.restaurant),
    ],
  );

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );

}