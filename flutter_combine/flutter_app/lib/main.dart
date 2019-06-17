import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/tbf_enter_forum_datas.dart';
import 'package:flutter_app/tbf_image_widget.dart';
import 'package:flutter_app/tbf_oval_forum_avatar.dart';
import 'package:flutter_app/tbf_forum_level_icon.dart';
import 'dart:ui';


void main() => runApp(MyApp());
//void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'route1':
      return Center(
        child: Text('route: $route', textDirection: TextDirection.ltr),
      );
    case 'route2':
      return Center(
        child: Text('route: $route', textDirection: TextDirection.ltr),
      );
    default:
      return Center(
        child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
      );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random();
    return new MaterialApp(
      //title: 'Startup Name Generator',
      title: '进吧',
      home: new EnterForumPage(),
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      /*
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          //child: new Text('Hello world'),
          //child: new Text(wordPair.asPascalCase)
          child: RandomWords(),
        ),
      ),*/
    );
  }
    /*return MaterialApp(
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }*/
}

class EnterForumPage extends StatefulWidget {
  @override
  State createState() => EnterForumPageState();
}


class EnterForumPageState extends State<EnterForumPage> {

  TBFEnterForumData _forumData;
  List _forumlist;

  @override
  void initState() {
    _forumData = TBFEnterForumData();
    _forumData.barInfoList().then((_){
      setState(() {
        _forumlist  = _forumData.forumList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('进吧'),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildBarListBody(),
    );
  }

  void _pushSaved() {
    setState(() {
      _forumlist  = _forumData.forumList;
    });
    print(_forumData.forumList.length);
  }

  Widget _buildBarListBody() {

    if (_forumData == null || _forumData.forumList == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return new ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _forumlist.length,
          itemBuilder: (context, index) {
            TBFBarInfo barInfo = _forumlist.elementAt(index);
            if (barInfo is TBFAttention) {
              return _buildConcernForumLabel();
            } else {
              return _buildConcernForumItem(barInfo);
            }
          }
      );
    }
  }

  /// 构造关注的吧Item
  Widget _buildConcernForumItem(TBFBarInfo info) {
    return InkWell(
        child: Container(
          height: 60.0,
          padding: EdgeInsets.only(left: 17.0, right: 17.0),
          child: Row(
            children: <Widget>[
              OvalForumAvatar(
                width: 35,
                height: 35,
                imageChild: TbImageWidget(
                  url: info.forumAvatar,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        info.forumName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          inherit: true,
                          // color: DynamicTheme.of(context).data.primaryTextTheme.title.color,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onSurface,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        info.forumIntro,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          inherit: true,
                          // color: DynamicTheme.of(context).data.primaryTextTheme.title.color,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onSurface,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  )

                ),
              ),
              ForumLevelIcon(
                width: 20,
                height: 20,
                value: info.levelId,
              ),
            ],
          ),
        ));
  }

  /// 构造"关注的吧" label
  Widget _buildConcernForumLabel() {
    return Container(
      height: 30,
      padding: EdgeInsets.only(left: 17.0, right: 17.0),
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .canvasColor,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "关注的吧",
              style: TextStyle(
                inherit: true,
                color: Theme
                    .of(context)
                    .colorScheme
                    .onSurface,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



////////////////////////////////////////////////////////////////////////////////
class RandomWords extends StatefulWidget {
  @override
  State createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _saved = new Set<WordPair>();


  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random();
    //return new Text(wordPair.asPascalCase);
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
                  return new ListTile(
                    title: new Text(
                      pair.asPascalCase,
                      style: _biggerFont,
                    ),
                  );
                  },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i ) {
          if(i.isOdd) return new Divider();

          final index = i ~/ 2;
          if(index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {

    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved){
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
          // Column is also layout widget. It takes a list of children and
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
            Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
