import 'package:flutter/material.dart';
import 'package:todolistplus/pages/home/home_controller.dart';
import 'package:todolistplus/utils/exports.dart';

import '../../../data/model/todo_model.dart';
import '../../../routes/app_routes.dart';
import '../../add_new_note/widgets/name_task_widget.dart';
import '../../home/widget/item_list_widget.dart';
import '../task_controller.dart';

class ItemSlideWidget extends StatefulWidget {
  final String? titleStep;
  final Future<List<Todo>> listItem;
  final Function(String) onPress;

  const ItemSlideWidget(
      {Key? key,
      required this.titleStep,
      required this.listItem,
      required this.onPress})
      : super(key: key);

  @override
  _ItemSlideWidgetState createState() => _ItemSlideWidgetState();
}

class _ItemSlideWidgetState extends State<ItemSlideWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white.withOpacity(0.6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 1,
            child: Text(
              "${widget.titleStep}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor),
            ),
          ),
          Flexible(
            flex: 8,
            child: FutureBuilder<List<Todo>>(
                future: widget.listItem,
                builder: (_, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    final todoList = snapshot.data!;
                    return ReorderableListView.builder(
                      shrinkWrap: false,
                      itemCount: todoList.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = todoList[index];
                        return buildItem(index, data);
                      },
                      onReorder: (int oldIndex, int newIndex) {
                        setState(() {
                          final index =
                              newIndex > oldIndex ? newIndex - 1 : newIndex;
                          final data = todoList.removeAt(oldIndex);
                          todoList.insert(index, data);
                        });
                      },
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
          Flexible(
            flex: 2,
            child: InkWell(
              onTap: () {
                showDialogWithFields();
                // Get.toNamed(
                //   AppRoutes.CREATENOTE,
                // );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8, right: 8),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Nhiệm vụ mới",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(int index, Todo data) {
    return ListTile(
      key: ValueKey(data),
      title: Text(data.title),
      subtitle: const Text('Hi this is the last message'),
    );
  }

  void showDialogWithFields() {
    var titleController = TextEditingController();
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Them'),
          content: Container(
            height: 100,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                NameTaskWidget(
                  titleTaskController: titleController,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Huy'),
            ),
            TextButton(
              onPressed: () {
                widget.onPress(titleController.text);
                Navigator.pop(context);
              },
              child: Text('Them'),
            ),
          ],
        );
      },
    );
  }
}
