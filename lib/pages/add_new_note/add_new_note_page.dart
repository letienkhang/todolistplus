import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistplus/pages/add_new_note/widgets/custom_chip_time_widget.dart';
import 'package:todolistplus/pages/add_new_note/widgets/description_task_widget.dart';
import 'package:todolistplus/pages/home/home_controller.dart';

import 'widgets/date_time_widget.dart';
import 'widgets/name_task_widget.dart';

class AddNewNotePage extends StatelessWidget {

  const AddNewNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: theme.backgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: theme.primaryColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
            child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ListView(
                children: [
                  // _createNewTaskString(context),
                  const SizedBox(
                    height: 30,
                  ),
                  NameTaskWidget(
                    titleTaskController: controller.titleController.value,
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // DescriptionTaskWidget(
                  //   taskController: controller.descriptionController.value,
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const DateTimeWidget(),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  // Row(
                  //   children: [
                  //     CustomChipTimeWidget(
                  //       title: "Start Time",
                  //       textStyle: theme.textTheme.bodyText1,
                  //       date: controller.eventTimeStart.value,
                  //       onPressed: () async {
                  //         final time = TimeOfDay.now();
                  //         controller.eventTimeStart.value =
                  //             (await showTimePicker(
                  //           context: context,
                  //           initialTime: time,
                  //         ))!;
                  //         controller.update();
                  //       },
                  //     ),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     CustomChipTimeWidget(
                  //       title: "End Time",
                  //       textStyle: theme.textTheme.bodyText1,
                  //       date: controller.eventTimeEnd.value,
                  //       onPressed: () async {
                  //         final time = TimeOfDay.now();
                  //         controller.eventTimeEnd.value = (await showTimePicker(
                  //           context: context,
                  //           initialTime: time,
                  //         ))!;
                  //         controller.update();
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: FloatingActionButton(
                  backgroundColor: theme.primaryColor,
                  onPressed: () {
                    if (controller.titleController.value.text.isNotEmpty) {
                      // controller.addTodo();
                      Get.snackbar("Success", "");
                      Navigator.of(context).pop();
                    } else {
                      Get.snackbar("Title is empty", "");
                    }
                  },
                  child: Icon(
                    Icons.add,
                    color: theme.primaryColorLight,
                  ),
                ),
              ),
            ),
          ],
        )),
      );
    });
  }

  _createNewTaskString(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      "Create New Tasks",
      style: theme.textTheme.headline4,
    );
  }
}
