// FirstPage.dart
import 'dart:convert';

import 'package:flutter/material.dart';

const String jsonData = '''
[
  {"id": 1, "name": "Item 1"},
  {"id": 2, "name": "Item 2"},
  {"id": 3, "name": "Item 3"}
]
''';

// Model class representing each object in the JSON data
class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> jsonList = json.decode(jsonData);
    List<Item> items =
        jsonList.map((itemJson) => Item.fromJson(itemJson)).toList();

    return Scaffold(
        appBar: AppBar(
          title: const Text('First Page'),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index].name),
                subtitle: Text('ID: ${items[index].id}'),
              );
            }));
  }
}
