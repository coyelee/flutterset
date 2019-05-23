import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GridListDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final title = 'Grid List';
    // TODO: implement build
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
          backgroundColor: Colors.red,
          flexibleSpace: Text('cwli_cc'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.map),
                onPressed: null
            ),
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: null
            ),
          ],
          leading: Builder(
              builder: (BuildContext buildContext) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed:() {
                    //Scaffold.of(context).openDrawer();
                    Navigator.pop(context);
                  },
                );
              }),
        ),
        body: new GridView.count(
          crossAxisCount: 2,
          children: new List.generate(100, (index) {
             return new Center(
               child: new Text(
                 'Item $index',
                 style: Theme.of(context).textTheme.headline,
               ),
             );
          }),
        ),
      ),
    );
  }
}

class DismissAbleDemo extends StatelessWidget {

  final List<String> items;
  DismissAbleDemo({Key key, @required this.items}):super(key:key);

  @override
  Widget build(BuildContext context) {

    final title = 'Dismissing Items';
    return MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('dismissable'),
        ),
        body: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
                final item = items[index];
                return new Dismissible(
                    key: new Key(item),
                    onDismissed: (direction) {
                      items.removeAt(index);
                      Scaffold.of(context).showSnackBar(
                          new SnackBar(content: new Text("$item dismissed")));
                    },
                    background: new Container(color: Colors.red),
                    child: new ListTile(title: new Text('$item')),
                );
            },
        ),
      ),
    );
  }
}


class TutorialHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: Builder(
            builder: (BuildContext buildContext) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed:() {
                  //Scaffold.of(context).openDrawer();
                  Navigator.pop(context);
                },
              );
            }),
        title: new Text('Widget Set'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: null),
        ],
      ),
      /*body: new Center(
        child: new Text('tie ba'),
      ),*/
      //body: Center(child: new MyGestureButton()),
      body: Center(child: new MyInkWellButton()),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Add',
          child: new Icon(Icons.add),
          onPressed: null
      ),
    );
  }
}

class MyGestureButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        print('button is taped');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('tieba'),
        ),
      ),
    );
  }
}

class MyInkWellButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text('Tap')));
      },
      child: Container(
        height: 36.0,
        padding: new EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Text('Flat Button'),
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;
  Todo({this.title, this.description});
}

class TodosScreen extends StatelessWidget  {

  final List<Todo> todos;
  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Todos'),
      ),
      body: new ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
             return new ListTile(
               title: new Text(todos[index].title),
               onTap: (){
                 Navigator.push(
                     context,
                   new MaterialPageRoute(
                     builder: (context) => new DetailScreen(todo: todos[index]),
                   ),
                 );
               },
             );
          },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final Todo todo;

  // In the constructor, require a Todo
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${todo.title}"),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: Center(
          child: new Text('${todo.description}'),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Returning Data Demo'),
      ),
      // We'll create the SelectionButton Widget in the next step
      body: new Center(child: new SelectionButton()),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: new Text('Pick an option, any option!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that will complete after we call
    // Navigator.pop on the Selection Screen!
    final result = await Navigator.push(
      context,
      // We'll create the SelectionScreen in the next step!
      new MaterialPageRoute(builder: (context) => new SelectionScreen()),
    );

    // After the Selection Screen returns a result, show it in a Snackbar!
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("$result")));
  }
}


class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Pick an option'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  // Pop here with "Yep"...
                  // Our Yep button will return "Yep!" as the result
                  Navigator.pop(context, 'Yep!');
                },
                child: new Text('Yep!'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  // Pop here with "Nope"
                  Navigator.pop(context, 'Nope!');
                },
                child: new Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<Post> fetchPost() async {

  final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final responseJson = json.decode(response.body);

  return new Post.fromJson(responseJson);
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class HttpRequestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Fetch Data Example'),
        ),
        body: new Center(
          child: new FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }
              // By default, show a loading spinner
              return new CircularProgressIndicator();
            },
          ),
        )
    );
  }
}


