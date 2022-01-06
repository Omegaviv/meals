import 'dart:ui';

import 'package:flutter/material.dart';


import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const route ='/filter-screen';

  final Function saveFilter;
  final Map<String, bool> selected;


  FiltersScreen(this.saveFilter, this.selected);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {



  bool _isGlutenFree =false;
  bool _isLactoseFree=false;
  bool _isVegan=false;
  bool _isVegetarian=false;



  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.selected['gluten'] as bool;
    _isLactoseFree = widget.selected['lactose'] as bool;
    _isVegan = widget.selected['vegan'] as bool;
    _isVegetarian = widget.selected['vegetraian'] as bool;

  }

  Widget _builtSelection(String title, String des, bool currVal, Function updateVal){
    return SwitchListTile(
        title: Text(title,style: TextStyle(
            fontSize:18,
            fontWeight: FontWeight.normal
        ),),
        subtitle: Text(des),
        value: currVal,
        onChanged:(newVal)=> updateVal(newVal),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: (){
                Map<String, bool> filter ={
                  'gluten':_isGlutenFree,
                  'lactose':_isLactoseFree,
                  'vegan':_isVegan,
                  'vegetraian':_isVegetarian,
                };
                widget.saveFilter(filter);
              },
              icon: Icon(Icons.save))
        ],
      ),

      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text('Adjeust your Meal Selection',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
            ),
          ),

          Expanded(child: ListView(
            children: [
              _builtSelection("Gluten-Free", 'Only include Gluten free meals', _isGlutenFree, (newVal){
                setState(() {
                  _isGlutenFree = newVal;
                });
              }),

              _builtSelection("Lactose-Free", 'Only include Lactose free meals', _isLactoseFree, (newVal){
                setState(() {
                  _isLactoseFree = newVal;
                });
              }),

              _builtSelection("Vegan", 'Only include Vegan meals', _isVegan, (newVal){
                setState(() {
                  _isVegan = newVal;
                });
              }),

              _builtSelection("Vegetarian", 'Only include Vegetarian meals', _isVegetarian, (newVal){
                setState(() {
                  _isVegetarian = newVal;
                });
              })

            ],
          ))
        ],
      ),

    );
  }
}
