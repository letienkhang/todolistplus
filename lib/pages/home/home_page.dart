import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistplus/data/model/todo_model.dart';
import 'package:todolistplus/pages/home/home_controller.dart';
import 'package:todolistplus/routes/app_routes.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:todolistplus/utils/exports.dart';

import 'widget/item_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final HomeController controller = Get.put(HomeController());
    int _clickCount = 0;
    return Scaffold(
      backgroundColor: kTranperColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 11, bottom: 11),
                decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
                child: FlutterDatePickerTimeline(
                  startDate: DateTime(DateTime.now().year, 01, 31),
                  endDate: DateTime(DateTime.now().year, 12, 30),
                  initialSelectedDate: DateTime.now(),
                  onSelectedDateChange: (DateTime? date) {
                    if (_clickCount != 0) {
                      controller.eventAddValueSelect(date);
                      // controller.getNoteByDay(convertToString(date!));
                    } else {}
                    _clickCount++;

                    if (kDebugMode) {
                      print("$date");
                    }
                  },
                )),
            GetBuilder<HomeController>(
              init: controller, // INIT IT ONLY THE FIRST TIME
              builder: (controller) => Padding(
                padding: const EdgeInsets.only(top: 60),
                child: FutureBuilder<List<Todo>>(
                    future: controller.myTodo,
                    builder: (_, snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        final todoList = snapshot.data!;
                        return ListView(
                          physics: const BouncingScrollPhysics(),
                          children: todoList
                              .map((e) => ItemListWidget(
                                    todo: e,
                                    onPress: (data) {
                                      // Get.defaultDialog(title: data.title);
                                      Get.snackbar(
                                          data.title, "${data.description}");
                                    },
                                  ))
                              .toList(),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      } else {
                        return const Center(
                          child: Text("Nothing"),
                        );
                      }
                    }),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {
                    Get.toNamed(AppRoutes.CREATENOTE);
                    // controller.addTodo();
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
