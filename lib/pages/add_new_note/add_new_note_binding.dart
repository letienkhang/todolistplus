import 'package:get/get.dart';
import 'package:todolistplus/pages/add_new_note/add_new_note_controller.dart';

class AddNewNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewNoteController>(() => AddNewNoteController());
  }
}
