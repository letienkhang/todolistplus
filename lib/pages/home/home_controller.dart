import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistplus/data/model/todo_model.dart';
import 'package:todolistplus/data/todo_storage.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  var titleController = TextEditingController().obs;
  var descriptionController = TextEditingController().obs;

  @override
  void onInit() {
    getAllNote();
  }

  Future<void> addTodo() async {
    final todo = Todo(
        title: titleController.value.text,
        description: descriptionController.value.text);
    await todoStorage.insertTodo(todo);
    update();
  }

  String _getRandomTitle() {
    final r = Random();
    return String.fromCharCodes(
      List.generate(
        50,
        (index) => r.nextInt(33) + 89,
      ),
    );
  }

  Future<List<Todo>>? getAllNote() async {
    return todoStorage.readTodoList();
  }
}
