import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_getx/controller/controller.dart';
import 'package:todo_getx/view/add_task_screen.dart';
import 'package:todo_getx/view/task_tile.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({Key? key}) : super(key: key);
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => (controller.taskList.isEmpty)
              ? const Center(
                  child: Text(
                    "No Task Found",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: controller.taskList.length,
                    itemBuilder: (context, index) {
                      return TaskTile(
                        size: size,
                        time: controller.taskList[index].taskCreated,
                        des: controller.taskList[index].task,
                        press: () {
                           controller.deleteTask(controller.taskList[index]);
                        },
                      );
                    },
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            Get.to(AddTaskScreen());
          },
          child: const Icon(
            Icons.add,
          )),
    );
  }
}
