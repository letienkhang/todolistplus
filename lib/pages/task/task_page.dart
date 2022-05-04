import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistplus/data/model/todo_model.dart';

import '../home/home_controller.dart';
import 'widget/item_slide_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskStateTaskPage createState() => _TaskStateTaskPage();
}

class _TaskStateTaskPage extends State<TaskPage> {
  final List<String> imgList = ["Step 1", "Step 2", "Step 3"];

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(title: const Text('Task')),
      backgroundColor: Colors.blueGrey,
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        GetBuilder<HomeController>(
          init: controller,
          builder: (controller) => Flexible(
            child: CarouselSlider(
              items: imgList
                  .map((item) => ItemSlideWidget(
                        listItem: controller.myTodo,
                        titleStep: item,
                        onPress: (data) {
                          controller.addTodo("${imgList.indexOf(item) + 1}", data);
                        },
                        // index: "${imgList.indexOf(item)}",
                      ))
                  .toList(),
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: false,
                  height: 250,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                      controller.getNoteByDay("${index + 1}");
                    });
                  }),
            ),
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
