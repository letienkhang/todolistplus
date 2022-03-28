import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todolistplus/data/model/todo_model.dart';
import 'package:todolistplus/data/todo_storage.dart';
import 'package:todolistplus/utils/constant.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  var titleController = TextEditingController().obs;
  var descriptionController = TextEditingController().obs;
  var dateTimeNow = DateTime.now();
  var eventDateTime = DateTime.now().obs;
  var eventTimeStart = TimeOfDay.now().obs;
  var eventTimeEnd = TimeOfDay.now().obs;
  late Future<List<Todo>> myTodo;

  @override
  Future<void> onInit() async {
    myTodo = getNoteByDay(convertToString(dateTimeNow))!;
  }

  Future<void> addTodo() async {
    String date = convertToString(eventDateTime.value);
    final todo = Todo(
        title: titleController.value.text,
        description: descriptionController.value.text,
        day: date);
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

  TimeOfDay? setTime({TimeOfDay? time, TimeOfDay? result}) {
    time = result;
    update();
    return time;
  }

  Future<List<Todo>>? getAllNote() async {
    return todoStorage.readTodoList();
  }

  Future<List<Todo>>? getNoteByDay(String data) async {
    myTodo = todoStorage.readTodoListFilterDay(data);
    update();
    return myTodo;
  }
}
