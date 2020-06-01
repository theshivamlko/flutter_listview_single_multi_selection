import 'package:flutter/material.dart';
import 'package:flutterlistviewselection/Movie.dart';
import 'package:flutterlistviewselection/MultiSelectionExample.dart';
import 'package:flutterlistviewselection/SingleSelectionExample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> sortFilter = [
    'Sort by name A-Z',
    'Sort by release date',
    'Sort by Ratings',
    'Sort by Recently added'
  ];

  List<Movie> favoriteMovies = [
    Movie('Harry Potter'),
    Movie('Spider Man'),
    Movie('Venom'),
    Movie('Transformers'),
    Movie('The Last Witch Hunters')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleSelectionExample(sortFilter),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void openDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('List'),
            actions: <Widget>[Text('OK'), Text('Cancel')],
            content: Container(
                width: 300,
                height: 400,
                child: MultiSelectionExample(favoriteMovies)),
          );
        });
  }
}
