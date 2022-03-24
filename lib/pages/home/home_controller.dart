import 'dart:math';

import 'package:get/get.dart';
import 'package:todolistplus/data/model/todo_model.dart';
import 'package:todolistplus/data/todo_storage.dart';

class HomeController extends GetxController {
   bool isLoading = true;

  @override
  void onInit() {
    getAllNote();
  }

  Future<void> addTodo() async {
    final randomTitle = _getRandomTitle();
    final todo = Todo(title: randomTitle);
    await todoStorage.insertTodo(todo);
    getAllNote();
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
