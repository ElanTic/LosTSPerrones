import 'package:flutter/material.dart';
import 'package:itemtrackers/Views/Pag.dart';
import 'package:itemtrackers/Views/Pag2.dart';

class NavBarC extends StatefulWidget {
  const NavBarC({super.key});

  @override
  State<NavBarC> createState() => _NavBarCState();
}

class _NavBarCState extends State<NavBarC> {
  PageController _pageController = PageController();
  List<Widget> __screens = [Pag(), Pag2(), Pag()];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: const Text('Inicio'),
      //),
      body: PageView(
        controller: _pageController,
        children: __screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Publicar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Publicaciones',
          ),
          /* 
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Options',
          ),
          */
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
