import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());
//runApp() is the function responsible for running the app.
//The app is represented by the main widget, in this case MyApp instance.\
//Everything in Flutter is called as a widget.
//You compose your app by putting widgets together.

//Stateless widgets: they do not have a fixed or constant state. As they repre-
//sents the app itself they change their appearance often during app execution;
//Without memory;

//Stateful widgets: they have state and it is kept under memory; their state
//matter;

//We can extract parts of the flowing code and put it inside a widget.
//The app extends StatelessWidget, which makes the app itself a widget. 
//In Flutter, almost everything is a widget, including alignment, padding, 
//and layout.

//A widget’s main job is to provide a build() method that describes how to 
//display the widget in terms of other, lower level widgets.

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Only one method that returns a widget.
    return const MaterialApp(
      title: "Welcome to Flutter",
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; //A parameterized list.
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    //The Scaffold widget, from the Material library, provides a default app 
    //bar, and a body property that holds the widget tree for the home screen. 
    //The widget subtree can be quite complex.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Startup Name Generator"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    //A list view is an up-down scrolling list.
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) return Divider();
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
    //   return ListTile(
    //     title: Text(
    //       pair.asPascalCase,
    //       style: _biggerFont,
    //     ),
    //   );
    return ListTile(
      title: Transform.rotate(
        angle: 0.2,
        child: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      ),
    );
  }
}
