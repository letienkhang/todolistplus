import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistplus/data/model/todo_model.dart';
import 'package:todolistplus/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<List<Todo>>(
                    future: controller.getAllNote(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        final todoList = snapshot.data!;
                        return ListView(
                          children: todoList
                              .map(
                                (e) => Card(
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Text(e.title),
                              ),
                            ),
                          )
                              .toList(),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: FloatingActionButton(
                    onPressed: () {
                      controller.addTodo();
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
