import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(const MyApp());
//runApp() is the function responsible for running the app.
//The app is represented by the main widget, in this case MyApp instance.
//Everything in Flutter is called as a widget.
//You compose your app by putting widgets together.

//Stateless widgets: they do not have a fixed or constant state. As they repre-
//sent the app itself they change their appearance often during app execution;
//Without memory;
//Stateless widgets are immutable, meaning that their properties can’t
//change — all values are final.

//Stateful widgets: they have state and it is kept under memory; their state
//matter;
//Stateful widgets maintain state that might change during the lifetime of the
//widget. Implementing a stateful widget requires at least two classes:
//-> 1) a StatefulWidget class that creates an instance of;
//-> 2) a State class. The StatefulWidget class is, itself, immutable and can
//be thrown away and regenerated, but the State class persists over the lifetime
//of the widget.

//We can extract parts of the flowing code and put them inside a widget.
//The app extends StatelessWidget, which makes the app itself a widget.
//In Flutter, almost everything is a widget, including alignment, padding,
//and layout.

//A widget’s main job is to provide a build() method that describes how to
//display the widget in terms of other, lower level widgets.

//Each page is called as a route, so we have the home route (the main page
//of our app) and there could be added another ones as you'd need to.

//In Flutter, the Navigator manages a stack containing the app's routes.
//Pushing a route onto the Navigator's stack updates the display to that route.
//Popping a route from the Navigator's stack returns the display to the
//previous route.

//Some widget properties take a single widget (child), and other properties,
//such as action, take an array of widgets (children), as indicated by the
//square brackets ([]).

//An app is nothing but a tree of widgets one linked to each other in a
//hierarchy relationship.

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Only one method that returns a widget.
    //The context parameter is an object that stores the information of where
    //this widget is located in the tree of widgets.
    return MaterialApp(
      title: "Startup Name Generator",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  //The underscore enforces privacity for the widget.
  final _suggestions = <WordPair>[]; //A parameterized list.
  final _saved = <WordPair>{}; //A set to keep hold of the select rows.
  //It does not allow repetitive elements.
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    //The Scaffold widget, from the Material library, provides a default app
    //bar, and a body property that holds the widget tree for the home screen.
    //The widget subtree can be quite complex.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Startup Name Generator"),
        actions: [
          IconButton(onPressed: _pushSaved, icon: const Icon(Icons.list)),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    //A list view is an up-down scrolling list.
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        //The itemBuilder callback is called once per suggested word pairing,
        //and places each suggestion into a ListTile row. For even rows, the
        //function adds a ListTile row for the word pairing. For odd rows, the
        //function adds a Divider widget to visually separate the entries.
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) return const Divider();
          final int index = i ~/ 2; //Integer division.
          //1, 1, 2, 2, 3, 3
          //Excluding the counting of the dividers eventually
          //inserted when i is odd (line 57).
          //If we have reached the end of the list view,
          //then we have to insert more items.
          //This is done by addAll(generateWordPairs().take()).
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final isAlreadySaved = _saved.contains(pair);
    return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          isAlreadySaved ? Icons.favorite : Icons.favorite_border,
          color: isAlreadySaved ? Colors.red : null,
          semanticLabel: isAlreadySaved ? 'Remove from saved' : "Save",
        ),
        onTap: () {
          setState(
              () => isAlreadySaved ? _saved.remove(pair) : _saved.add(pair));
        });
  }

  void _pushSaved() {
    //Next, you'll build a route and push it to the Navigator's stack. That
    //action changes the screen to display the new route. The content for the
    //new page is built in MaterialPageRoute's builder property in an anonymous
    //function.
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];
          return Scaffold(
            appBar: AppBar(
              title: const Text("Saved Suggestions"),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}

//stful + enter to create the scratch of a stateful widget.
