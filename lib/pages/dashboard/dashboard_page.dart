import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistplus/pages/dashboard/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(),
        ),
      );
    });
  }
}
