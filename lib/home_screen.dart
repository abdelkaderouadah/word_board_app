import 'package:flutter/material.dart';
import 'package:word_board_app/components/drawer.dart';
import 'package:word_board_app/models/saved_words.dart';
import 'package:word_board_app/screens/home.dart';
import 'package:word_board_app/screens/past_word.dart';

class HomeScreen extends StatefulWidget {
  static final _savedWords = SavedWords.savedWords;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _savedWords = HomeScreen._savedWords;

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

  void _openFavoriteWords() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                'Favorite Words',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              elevation: 0.0,
              iconTheme: const IconThemeData(
                color: Colors.black,
                size: 25.0,
              ),
            ),
            body: Container(
              child: _savedWords.isNotEmpty
                  ? ListView(
                      children: _savedWords
                          .map(
                            (word) => Padding(
                              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                              child: Text(
                                '${word[0].toUpperCase()}${word.substring(1)}',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  : const Center(
                      child: Text(
                        'No favorite words',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }

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
            onPressed: _openFavoriteWords,
            icon: const Icon(
              Icons.favorite,
              color: Colors.black,
              size: 25.0,
            ),
          ),
        ],
      ),
      //IndexedStack:Creates a [Stack] widget that paints a single child.
      body: _widgetOptions[_selectedIndex],

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
