import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistplus/pages/dashboard/dashboard_controller.dart';
import 'package:todolistplus/utils/exports.dart';

import 'widget/item_title_setting_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemTitleSettingWidget(
                  icon: controller.isDark
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                  btnText: "Theme",
                  trailing: CupertinoSwitch(
                    activeColor: theme.primaryColor,
                    value: controller.isDark,
                    onChanged: (val) {
                      controller.isDark = !controller.isDark;
                      controller.changeTheme(val);
                    },
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
