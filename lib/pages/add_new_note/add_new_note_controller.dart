import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewNoteController extends GetxController {
  var titleController = TextEditingController().obs;
  var descriptionController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.value.clear();
    descriptionController.value.clear();
  }
}
