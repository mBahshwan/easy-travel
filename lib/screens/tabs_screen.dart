import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({Key key}) : super(key: key);

  final List<Trip> favoriteTrips;

  TabsScreen(this.favoriteTrips);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    _screens = [CategoriesScreen(), FavoritesScreen(widget.favoriteTrips)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _selectedScreenIndex == 1 ? Text("المفضله") : Text("التصنيفات"),
      ),
      drawer: const AppDrawer(),
      body: _screens.elementAt(_selectedScreenIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.yellow[700],
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
