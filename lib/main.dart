import 'package:flutter/material.dart';

void main() => runApp(MyRecipes());

class MyRecipes extends StatelessWidget {
  static const String _title = 'MyRecipes';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(title: _title),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.art_track)),
              Tab(icon: Icon(Icons.category)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecipeCreation()),
            );
          },
          tooltip: 'Create Recipe',
          child: Icon(Icons.create),
        ),
      ),
    );
  }
}

class RecipeCreation extends StatefulWidget {
  RecipeCreation({Key key}) : super(key: key);

  @override
  _RecipeCreationState createState() => _RecipeCreationState();
}

class _RecipeCreationState extends State<RecipeCreation> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}