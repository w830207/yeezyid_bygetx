import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeezyid_bygetx/app/controller/image_Controller.dart';
import 'package:yeezyid_bygetx/app/widget/ourAppbar.dart';
import 'package:yeezyid_bygetx/app/widget/ourButton.dart';

class HomePage extends StatelessWidget {
  final ImageController imageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OurAppbar(
        title: "選擇圖片",
        imagePath: '',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OurButton(
              minWidth: MediaQuery.of(context).size.width / 2,
              child: Text("gallery"),
              onPressed: () {
                imageController.openGallery();
                Get.toNamed("/home/useCamera");
              },
            ),
            OurButton(
              minWidth: MediaQuery.of(context).size.width / 2,
              child: Text("camera"),
              onPressed: () {
                imageController.openCamera();
                Get.toNamed("/home/useCamera");
              },
            ),
          ],
        ),
      ),
    );
  }
}
