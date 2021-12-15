import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  final String word;
  final String definition;
  final String exemple;
  final IconButton buttonSave;
  const CardTemplate(
      {Key? key,
      required this.word,
      required this.definition,
      required this.exemple,
      required this.buttonSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              word,
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic),
              iconSize: 35,
            ),
          ],
        ),
        const SizedBox(height: 45.0),
        const Text(
          'Definition: ',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          definition,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15.0),
        const Text(
          'Pronunciation / Exemple: ',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          exemple,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 40.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share_outlined),
            ),
            buttonSave,
          ],
        ),
      ],
    );
  }
}
