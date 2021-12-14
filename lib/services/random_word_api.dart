import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:word_board_app/models/random_word.dart';

class RandomWordApi {
  Future<RandomWord> getWord() async {
    var endpoint = Uri.parse("https://random-words-api.vercel.app/word");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return RandomWord.fromJson(body[0]);
  }
}
