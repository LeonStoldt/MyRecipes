import 'package:flutter/material.dart';
import 'package:myrecipes/recipeCreation/RecipeCreationView.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;
  final List<Tab> homePageTabs = <Tab>[
    Tab(icon: Icon(Icons.art_track)),
    Tab(icon: Icon(Icons.category)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: getAppBar(context),
        floatingActionButton: getFloatingCreateActionButton(context),
        body: getTabBarView(),
      ),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      bottom: TabBar(
        tabs: homePageTabs,
        indicatorColor: Theme.of(context).backgroundColor,
      ),
    );
  }

  FloatingActionButton getFloatingCreateActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RecipeCreationView()));
      },
      tooltip: 'Create Recipe',
      child: Icon(Icons.add),
    );
  }

  TabBarView getTabBarView() {
    return TabBarView(
      children: homePageTabs.map((Tab tab) {
        return Center(
          child: Text(
            'This is the tab.icon',
            style: const TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
    );
  }
}