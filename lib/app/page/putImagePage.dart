import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeezyid_bygetx/app/controller/image_Controller.dart';
import 'package:yeezyid_bygetx/app/widget/ourAppbar.dart';
import 'package:yeezyid_bygetx/app/widget/ourButton.dart';

class PutImagePage extends StatelessWidget {
  final ImageController imageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OurAppbar(
        title: "確認圖片",
        imagePath: imageController.theImage.value,
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
                child: Obx(() => imageController.theImage.value == ''
                    ? Text('no image here!')
                    : Image.file(File(imageController.theImage.value))),
                fit: BoxFit.contain,
              ),
            ),
            OurButton(
                onPressed: () {
                  imageController.loadModel000();
                  Get.toNamed("/home/useCamera/answer");
                },
                child: Text("開始辨識")),
            OurButton(
                onPressed: () {
                  imageController.theImage.value = '';
                  Get.toNamed("/home");
                },
                child: Text("重新選圖")),
          ],
        ),
      ),
    );
  }
}
