import 'package:todolistplus/pages/task/task_controller.dart';

import '../../utils/exports.dart';
import '../home/home_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(() => TaskController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
