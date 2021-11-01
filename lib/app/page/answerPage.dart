import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeezyid_bygetx/app/controller/image_Controller.dart';
import 'package:yeezyid_bygetx/app/widget/ourAppbar.dart';
import 'package:yeezyid_bygetx/app/widget/ourButton.dart';
import 'package:yeezyid_bygetx/app/widget/ourCard.dart';

class answerPage extends StatelessWidget {
  image_Controller image_controller = Get.put(image_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppbar(title: "辨識結果",imagePath: image_controller.theimage.value,),
      body: Center(
          child: Obx(
        () => Column(
          children: [
            ourCard(
                type: image_controller.type.value,
                output: image_controller.output.value,
                imageURL: image_controller.imageURL.value,
                URL: image_controller.URL.value,
                HB: image_controller.HB.value,
                LA: image_controller.LA.value,
                LS: image_controller.LS.value),
            ourButton(onPressed: (){
              image_controller.theimage.value='';
              Get.offAllNamed("/home");
            }, child: Text("重新選圖")),
          ],
        ),
      )),
    );
  }
}
