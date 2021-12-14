import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:word_board_app/models/word.dart';

class WordDictionaryApi {
  Future<Word> getWord(String word) async {
    var endpoint =
        Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/$word");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Word.fromJson(body[0]);
  }
}
