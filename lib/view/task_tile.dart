


import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.size, required this.time, required this.des, required this.press,
  }) : super(key: key);

  final Size size;
  final String time;
  final String des;
  final Callback? press;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              width:size.width*0.1 ,
              height: double.maxFinite,
              color: Colors.red,
              child:  Center(child: Text("$time",style: TextStyle(fontSize: 18,color: Colors.white),)),
            ),
             Expanded(child:  Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("$des"),
            )),
             GestureDetector(
              onTap: press,
               child: Container(
                width:size.width*0.1 ,
                height: double.maxFinite,
                color: Colors.red,
                child: const Icon(Icons.delete,color:Colors.white),
                         ),
             ),
          ],
        ),
      ),
    );
  }
}
