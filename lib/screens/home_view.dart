import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:handle_list_with_bloc/controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView {
  static String name = "HomeView";
    HomeView({Key? key}) : super(key: key);

@override
  HomeController controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Select List Item"),
        centerTitle: true,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: controller.list.length,
        itemBuilder: (context, index) {
          return Obx(() =>
          GestureDetector(
            onTap: () {
              controller.list[index].isSelected.value =
                  !controller.list[index].isSelected.value;
            },
            child: Container(
              margin:
                  const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: controller.list[index].isSelected.value
                      ? Colors.green
                      : Colors.cyan),

                      child: Center(child: Text(controller.list[index].name)),
            ),
          ),);
        },
      ),
    );
  }
}
