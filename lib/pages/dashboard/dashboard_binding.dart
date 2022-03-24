import 'package:get/get.dart';
import 'package:todolistplus/pages/add_new_note/add_new_note_controller.dart';
import 'package:todolistplus/pages/home/home_controller.dart';

import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
