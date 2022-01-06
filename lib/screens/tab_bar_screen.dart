import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './caategory_screen.dart';

class TaPBarScreen extends StatefulWidget {

  List<Meal> favList;



  TaPBarScreen(this.favList);

  @override
  _TaPBarScreenState createState() => _TaPBarScreenState();
}

class _TaPBarScreenState extends State<TaPBarScreen> {

  late final List<Widget> _pages;

  final List<String> _titles = ['Categories', 'Your Favorites'];
  int _selectedItem =0;
  void _selectPage(int index){
    setState(() {
      _selectedItem = index;
    });
  }


  @override
  void initState() {
    super.initState();
    _pages = [CategoryScreen(), Favorites(widget.favList)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text(_titles[_selectedItem]),


        ),

        body: _pages[_selectedItem],
        drawer: MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: _selectedItem,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.category),
            label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star),
            label: 'Favorites'),


          ],
        ),

    );
  }
}
