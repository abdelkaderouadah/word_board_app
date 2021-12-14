import 'package:flutter/material.dart';
import 'package:word_board_app/components/drawer.dart';
import 'package:word_board_app/screens/home.dart';
import 'package:word_board_app/screens/past_word.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const PastWord(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 25.0,
        ),
        title: const Text(
          'Word Board',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //TODO favorite words
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.black,
              size: 25.0,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
            ),
            label: 'Word Board',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Past Word',
          ),
        ],
        backgroundColor: Colors.black,
        selectedFontSize: 18.0,
        selectedItemColor: Colors.white,
        unselectedFontSize: 15.0,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
