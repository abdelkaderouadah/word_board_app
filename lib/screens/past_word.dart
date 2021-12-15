import 'package:flutter/material.dart';
import 'package:word_board_app/models/past_words.dart';

class PastWord extends StatefulWidget {
  static final _pastWords = PastWords.pastWords;

  const PastWord({Key? key}) : super(key: key);

  @override
  State<PastWord> createState() => _PastWordState();
}

class _PastWordState extends State<PastWord> {
  final _pastWords = PastWord._pastWords;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _pastWords.isNotEmpty
          ? ListView(
              children: _pastWords
                  .map(
                    (word) => Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 12, 8),
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
                "You didn't search for words yet.",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
    );
  }
}
