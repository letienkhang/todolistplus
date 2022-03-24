import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolistplus/pages/add_new_note/add_new_note_controller.dart';

import 'widgets/name_task_widget.dart';

class AddNewNotePage extends StatelessWidget {
  const AddNewNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<AddNewNoteController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListView(
              children: [
                _createNewTaskString(context),
                SizedBox(height: 20.h),
                // NameTaskWidget(
                //   titleTaskController: controller.titleController.value,
                // ),
              ],
            ),
          ),
        ),
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
