import 'package:flutter/material.dart';
import 'package:receitas/presentation/presentation.dart';
import 'package:receitas/resources/resources.dart';

import '../../../models/meal/meal.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsPage(this.favoriteMeals, {super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectePageIndex = 0;
  late List<Widget> _pages;

  late List<String> _titles;

  @override
  void initState() {
    super.initState();
    _pages = [
      const CategoryPage(),
      FavoritePage(widget.favoriteMeals),
    ];
    _titles = [
      'Categorias',
      'Meus Favoritos',
    ];
  }

  _selectedPage(int index) {
    setState(() {
      _selectePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_titles[_selectePageIndex]),
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectePageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).hintColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectePageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category_rounded),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
