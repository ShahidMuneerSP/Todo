import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:todo_getx/model/model.dart';

class Controller extends GetxController {
  final taskList = <Model>[].obs;
  String txt="";

  List<Model> get tasklist => taskList.value;
  late TextEditingController textEditingController;
   @override
  void onInit() {
    textEditingController=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.clear();
  }
  void addTask() {
txt=textEditingController.text;
log(txt.toString());
  
  ;
  DateTime time = DateTime.now();

  taskList.add( Model(task: txt, taskCreated: time.day.toString()));
  textEditingController.clear();
  }
  void deleteTask(Model model) {
    taskList.remove(model);
  }
}
