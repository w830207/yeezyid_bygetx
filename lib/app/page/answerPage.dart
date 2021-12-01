import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeezyid_bygetx/app/controller/image_Controller.dart';
import 'package:yeezyid_bygetx/app/widget/ourAppbar.dart';
import 'package:yeezyid_bygetx/app/widget/ourButton.dart';
import 'package:yeezyid_bygetx/app/widget/ourCard.dart';

class AnswerPage extends StatelessWidget {
  final ImageController imageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OurAppbar(
        title: "辨識結果",
        imagePath: imageController.theImage.value,
      ),
      body: Center(
          child: Obx(
        () => Column(
          children: [
            OurCard(
                type: imageController.type.value,
                output: imageController.output.value,
                imageURL: imageController.imageURL.value,
                url: imageController.url.value,
                HB: imageController.HB.value,
                LA: imageController.LA.value,
                LS: imageController.LS.value),
            OurButton(
                onPressed: () {
                  imageController.theImage.value = '';
                  Get.offAllNamed("/home");
                },
                child: Text("重新選圖")),
          ],
        ),
      )),
    );
  }
}
