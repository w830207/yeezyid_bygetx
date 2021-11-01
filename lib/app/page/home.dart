import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeezyid_bygetx/app/controller/image_Controller.dart';
import 'package:yeezyid_bygetx/app/widget/ourAppbar.dart';
import 'package:yeezyid_bygetx/app/widget/ourButton.dart';

class home extends StatelessWidget {
  image_Controller image_controller = Get.put(image_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppbar(title: "選擇圖片",imagePath: '',),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ourButton(
              minWidth: MediaQuery.of(context).size.width / 2,
              child: Text("gallery"),
              onPressed: () {
                image_controller.openGallery();
                Get.offAllNamed("/home/useCamera");
              },
            ),

            ourButton(
              minWidth: MediaQuery.of(context).size.width / 2,
              child: Text("camera"),
              onPressed: () {
                image_controller.openCamera();
                Get.offAllNamed("/home/useCamera");
              },
            ),
          ],
        ),
      ),
    );
  }
}
