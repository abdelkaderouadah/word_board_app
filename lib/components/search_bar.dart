import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final TextEditingController controller;
  CustomSearchDelegate(this.controller);
  List<String> searchTerms = ['hello', 'nubiferous', 'zootheism'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "search result");
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var word in searchTerms) {
      if (word.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(word);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            controller.text = result;
          },
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var word in searchTerms) {
      if (word.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(word);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        String result = matchQuery[index];
        return ListTile(
          onTap: () {
            controller.text = result;
          },
          title: Text(result),
        );
      },
    );
  }
}
