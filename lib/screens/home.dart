import 'package:flutter/material.dart';
import 'package:word_board_app/components/card_item.dart';
import 'package:word_board_app/models/random_word.dart';
import 'package:word_board_app/models/word.dart';
import 'package:word_board_app/services/random_word_api.dart';
import 'package:word_board_app/services/word_dictionary_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _searchText = TextEditingController();
  String? result;
  WordDictionaryApi client = WordDictionaryApi();
  Word? data;
  late Future<RandomWord> futureWord;
  final String errorMsg =
      "Sorry , we couldn't find definitions for the word you were looking for .";

  @override
  void initState() {
    super.initState();
    futureWord = RandomWordApi().getWord();
  }

  // For pul to refresh
  Future<void> getWord() async {
    setState(() {
      futureWord = RandomWordApi().getWord();
      result = null;
      _searchText.clear();
    });
  }

  Future searchWord(String word) async {
    data = await client.getWord(word);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 0),
      child: RefreshIndicator(
        onRefresh: () => getWord(),
        child: ListView(
          children: [
            //TODO SearchField
            SizedBox(
              height: 45.0,
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  suffix: IconButton(
                    onPressed: getWord,
                    icon: const Icon(Icons.clear),
                  ),
                  hintText: 'Search words',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                keyboardType: TextInputType.text,
                controller: _searchText,
                onSubmitted: (value) {
                  setState(() {
                    result = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 15.0),
            //TODO Card
            SizedBox(
              height: 500.0,
              child: Card(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: (result == null)
                            ? FutureBuilder<RandomWord>(
                                future: futureWord,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    try {
                                      return cardItem(
                                          snapshot.data!.word,
                                          snapshot.data!.definition,
                                          snapshot.data!.pronunciation);
                                    } catch (e) {
                                      return Text(
                                        errorMsg,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      );
                                    }
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.none) {
                                    return const Text('Could not get word !');
                                  }
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                              )
                            : FutureBuilder(
                                future: searchWord(_searchText.text),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    try {
                                      return cardItem(
                                        "${data!.word[0].toUpperCase()}${data!.word.substring(1)}",
                                        "${data!.meanings[1].definitions[0].definition[0].toUpperCase()}${data!.meanings[1].definitions[0].definition.substring(1)}",
                                        "${data!.meanings[1].definitions[0].example[0].toUpperCase()}${data!.meanings[1].definitions[0].example.substring(1)}",
                                      );
                                    } catch (e) {
                                      return Text(
                                        errorMsg,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      );
                                    }
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.none) {
                                    return const Text('Could not get word !');
                                  }
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share_outlined),
                            iconSize: 35,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_outlined),
                            iconSize: 35,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
