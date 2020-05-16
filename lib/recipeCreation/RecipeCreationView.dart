import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myrecipes/bo/RecipeData.dart';
import 'package:myrecipes/recipeCreation/TimePicker.dart';

class RecipeCreationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecipeCreationViewState();
}

class _RecipeCreationViewState extends State<RecipeCreationView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RecipeData recipe = RecipeData();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("FlexibleSpace title"),
              background: Image.network(
                'https://picsum.photos/250?image=9',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // If the main content is a list, use SliverList instead.
          SliverFillRemaining(
            child: Center(child: getInputForm()),
          ),
        ],
      ),
    );
  }

  Form getInputForm() {
    const sizedBoxSpace = SizedBox(height: 24);
    final cursorColor = Theme.of(context).cursorColor;
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          sizedBoxSpace,
          getTextFormField(cursorColor, Icons.description, "Description", (value) {}, maxLines: 7),
          sizedBoxSpace,
          TimePicker(),
          sizedBoxSpace,
          getTextFormField(cursorColor, Icons.group, "Amount", (value) {}, textInputType: TextInputType.number, suffixText: "Persons"),
          sizedBoxSpace,
          Center(
            child: RaisedButton(
              child: Text("Save"),
              onPressed: _saveRecipe,
            ),
          ),
          sizedBoxSpace,
        ],
      ),
    );
  }

  TextFormField getTextFormField(
      Color cursorColor,
      IconData icon,
      String labelText,
      FormFieldSetter formFieldSetter,
      {TextInputType textInputType = TextInputType.text,
       int maxLines = 1,
       String suffixText = ''
      }) {
    return TextFormField(
          cursorColor: cursorColor,
          decoration: InputDecoration(
            icon: Icon(icon),
            labelText: labelText,
            suffixText: suffixText,
            border: OutlineInputBorder(borderSide: BorderSide())
          ),
          keyboardType: textInputType,
          onSaved: formFieldSetter,
          maxLines: maxLines,
        );
  }

  void _saveRecipe() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidate = true; // Start validating on every change.
      showInSnackBar("Error while saving");
    } else {
      form.save();
      showInSnackBar("Recipe saved successfully");
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }
}
