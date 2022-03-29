import 'package:get/get.dart';
import 'package:todolistplus/utils/exports.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;
  bool isDark = false;
  var theme = true.obs;
  final box = GetStorage();
  static const themeKey = "THEMEKEY";

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  Future<void> changeTheme(bool value) async {
    if (value) {
      theme.value = true;
      Get.changeThemeMode(ThemeMode.dark);
      update();
      await box.write(themeKey, "True");
    } else {
      theme.value = false;
      Get.changeThemeMode(ThemeMode.light);
      await box.write(themeKey, "false");
      update();
    }
  }


}
