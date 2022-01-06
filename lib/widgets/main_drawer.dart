import 'package:flutter/material.dart';
import 'package:meal/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget listTileBuilder(String title, Icon icon, Function clickHandler){
    return ListTile(
      leading: icon,
      title: Text(title, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18
      ),),
      onTap: ()=>clickHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.25,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text('Let\'s Cook!' , style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold, fontSize: 35,
              color: Theme.of(context).accentColor
            ),),
           color:  Theme.of(context).primaryColor.withOpacity(0.7),

          ),
          SizedBox(height: 10,),
          listTileBuilder('Meals', Icon(Icons.restaurant),(){

            Navigator.of(context).pushReplacementNamed('/');

          }),
          listTileBuilder('Filter', Icon(Icons.settings),(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.route);
          }),




        ],
      ),
    );
  }
}
