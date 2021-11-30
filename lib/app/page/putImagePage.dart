import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeezyid_bygetx/app/controller/image_Controller.dart';
import 'package:yeezyid_bygetx/app/widget/ourAppbar.dart';
import 'package:yeezyid_bygetx/app/widget/ourButton.dart';

class putImagePage extends StatelessWidget {
  image_Controller image_controller = Get.put(image_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppbar(
        title: "確認圖片",
        imagePath: image_controller.theimage.value,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: FittedBox(
                child: Obx(() => image_controller.theimage.value == ''
                    ? Text('no image here!')
                    : Image.file(File(image_controller.theimage.value))),
                fit: BoxFit.contain,
              ),
            ),
            ourButton(
                onPressed: () {
                  image_controller.loadModel000();
                  Get.toNamed("/home/useCamera/answer");
                },
                child: Text("開始辨識")),
            ourButton(
                onPressed: () {
                  image_controller.theimage.value = '';
                  Get.toNamed("/home");
                },
                child: Text("重新選圖")),
          ],
        ),
      ),
    );
  }
}
