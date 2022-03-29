import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todolistplus/data/model/todo_model.dart';
import 'package:todolistplus/utils/exports.dart';

class ItemListWidget extends StatelessWidget {
  final Todo todo;
  final Function(Todo todo) onPress;

  const ItemListWidget({Key? key, required this.todo, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _itemBuilder(context);
  }

  Widget _itemBuilder(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress(todo);
      },
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "${todo.description}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  fhfh() {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
      leading: CircleAvatar(
        child: Text(
          todo.title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.grey,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${todo.description}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            "${todo.description}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ],
      ),
      // trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
