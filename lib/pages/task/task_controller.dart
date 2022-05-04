import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todolistplus/data/model/todo_model.dart';
import 'package:todolistplus/data/todo_storage.dart';
import 'package:todolistplus/utils/constant.dart';

class TaskController extends GetxController {
  late Future<List<Todo>> myTodo;

  @override
  Future<void> onInit() async {
    myTodo = getAllNote()!;
  }

  Future<List<Todo>>? getAllNote() async {
    myTodo = todoStorage.readTodoList();
    return myTodo;
  }
}
