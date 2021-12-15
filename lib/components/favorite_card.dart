import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final String word;
  //final String definition;
  const FavoriteCard({
    Key? key,
    required this.word,
    //required this.definition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: Card(
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        elevation: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                word,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
