import 'package:flutter/material.dart';
import 'cook_book.dart';
import 'animated_sample.dart';
import 'preferredsize_sample.dart';
import 'expansion_sample.dart';
import 'flutter_layout_1.dart';
import 'flutter_layout_2.dart';


//void main() => runApp(MyApp());

void main() => runApp(
  new MaterialApp(
    title: 'My app',
    //home: new TutorialHome(),
    home: new ShoppingList(
      products: <Product>[
        new Product(name: 'Grid List'),
        new Product(name: 'Every Button'),
        new Product(name: 'Dismissable'),
        new Product(name: 'Page Pass'),
        new Product(name: 'Back Value'),
        new Product(name: 'Http Request'),
        new Product(name: 'Animation sample'),
        new Product(name: 'PreferredSize sample'),
        new Product(name: 'BasicAppBar sample'),
        new Product(name: 'Expansion sample'),
        new Product(name: 'Tabbed AppBar sample'),
        new Product(name: 'Flutter Layout one'),
        new Product(name: 'Flutter Layout Two'),
      ],
    ),
    routes: {
      'GridListRoute': (BuildContext context) => new GridListDemo(),
      'TutorialRoute': (BuildContext context) => new TutorialHome(),
      'DismissableRoute': (BuildContext context) => new DismissAbleDemo(items: new List<String>.generate(20, (i) => "Item ${i + 1}")),
      'BackValueRoute': (BuildContext context) => new HomeScreen(),
      'HttpRequestRoute': (BuildContext context) => new HttpRequestDemo(),
      'AnimatedRoute': (BuildContext context) => new AnimatedListSample(),
      'PreferredRoute': (BuildContext context) => new AppBarBottomSample(),
      'AppBarRoute': (BuildContext context) => new BasicAppBarSample(),
      'ExpantionRoute': (BuildContext context) => new ExpansionTileSample(),
      'TabbedAppbarRoute': (BuildContext context) => new TabbedAppBarSample(),
      'FlutterLayoutOneRoute': (BuildContext context) => new FlutterLayoutOne(),
      'FlutterLayoutTwoRoute': (BuildContext context) => new FlutterLayoutTwo(),
      'PagePassValueRoute': (BuildContext context) => new TodosScreen(
          todos: new List.generate(
              20,
              (i) => new Todo(
                  title: 'Todo $i',
                  description: 'A description of what needs to be done for Todo $i'),
          ),
      ),
    },
  ),
);


class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {

  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
  : product = product,
  super(key:new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor (BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if(!inCart) return null;

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
    );
  }
}


class ShoppingList extends StatefulWidget {

  ShoppingList({Key key, this.products});

  final List<Product>products;

  @override
  _ShoppingListState createState() => _ShoppingListState();


}

class _ShoppingListState extends State<ShoppingList> {

  Set<Product>_shoppingCart = new Set<Product>();

  @override
  void initState() {
    super.initState();
  }

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When user changes what is in the cart, we need to change _shoppingCart
      // inside a setState call to trigger a rebuild. The framework then calls
      // build, below, which updates the visual appearance of the app.

      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });

    String name = product.name;
    if(name == 'Grid List') {
      //Navigator.pushNamed(context, 'GridListRoute');
      Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new GridListDemo()),
      );
    } else if (name == 'Every Button') {
      Navigator.pushNamed(context, 'TutorialRoute');
    } else if (name == 'Dismissable') {
      Navigator.pushNamed(context, 'DismissableRoute');
    } else if (name == 'Page Pass'){
      Navigator.pushNamed(context, 'PagePassValueRoute');
    } else if (name == 'Back Value') {
      Navigator.pushNamed(context, 'BackValueRoute');
    } else if (name == 'Http Request') {
      Navigator.pushNamed(context, 'HttpRequestRoute');
    } else if (name == 'Animation sample') {
      Navigator.pushNamed(context, 'AnimatedRoute');
    } else if (name == 'PreferredSize sample') {
      Navigator.pushNamed(context, 'PreferredRoute');
    } else if (name == 'BasicAppBar sample') {
      Navigator.pushNamed(context, 'AppBarRoute');
    } else if (name == 'Expansion sample') {
      Navigator.pushNamed(context, 'ExpantionRoute');
    } else if(name == 'Tabbed AppBar sample') {
      Navigator.pushNamed(context, 'TabbedAppbarRoute');
    } else if(name == 'Flutter Layout one') {
      Navigator.pushNamed(context, 'FlutterLayoutOneRoute');
    }
    else if(name == 'Flutter Layout Two') {
      Navigator.pushNamed(context, 'FlutterLayoutTwoRoute');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Study Flutter List'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.menu), 
              onPressed: () {
                //Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('cwli study flutter')));
                showDialog(
                    context: context,
                    builder: (context) {
                      return new SimpleDialog(
                        title: Center(
                          child: Text('Google flutter technology'),
                        ),
                        backgroundColor: Colors.red[500],
                        titlePadding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        elevation: 2,
                        children: <Widget>[
                          ListTile(
                            title: Center(child: Text('Study')),
                          ),
                          ListTile(
                            title: Center(child: Text('Flutter')),
                          ),
                        ],
                      );
                    },
                );
              }
          ),
        ],
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}



class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu), 
              tooltip: 'Navigation meuu',
              onPressed: null
          ),
          
          new Expanded(
              child: title
          ),

          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}


class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),

          new Expanded(
            child: new Center(
              child: new Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
              'You have pushed the button this many times:',
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
