import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:tflite/tflite.dart';

class ImageController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  late final theImage = XFile("").path.obs;
  RxString type = ''.obs;
  RxString output = ''.obs;
  RxString url = 'https://findicons.com/files/icons/1008/quiet/256/no.png'.obs;
  RxString imageURL =
      'https://findicons.com/files/icons/1008/quiet/256/no.png'.obs;
  RxString HB = 'Highest Bid'.obs;
  RxString LA = 'Lowest Ask'.obs;
  RxString LS = 'Last Sale'.obs;

  loadModel000() async {
    await Tflite.loadModel(
        model: "assets/models/quantized_000.tflite",
        labels: "assets/models/labels000.txt");
    print("=================000模型加載成功===================");
    runModelOnImage();
  }

  loadModelother(String id) async {
    await Tflite.loadModel(
        model: "assets/models/quantized_" + id + ".tflite",
        labels: "assets/models/labels" + id + ".txt");
    print("=================" + id + "模型加載成功===================");
    runModelOnImage();
  }

  runModelOnImage() async {
    var slist = [
      '350',
      '350v2',
      '380',
      '500',
      '700',
      '700MNVN',
      '700v2',
      '700v3',
      '750',
      '950',
      'Foam',
      'QNTM'
    ];
    var res = await Tflite.runModelOnImage(
      path: theImage.value,
      imageMean: 0.0,
      // defaults to 117.0
      imageStd: 255.0,
      // defaults to 1.0
      numResults: 2,
      // defaults to 5
      threshold: 0.2,
    );

    if (slist.contains(res![0]['label'])) {
      type.value = res[0]['label'];
      print("=================得到型號了 接下來加載配色模型===================");
      loadModelother(type.value);
    } else {
      output.value = res[0]['label'];
      print("=================得到配色了 接下來getData()===================");
      getData();
    }
  }

  openCamera() async {
    var pathC = (await _picker.pickImage(source: ImageSource.camera));
    theImage.value = pathC!.path;
  }

  openGallery() async {
    var pathG = (await _picker.pickImage(source: ImageSource.gallery));
    theImage.value = pathG!.path;
  }

  getData() async {
    await Firebase.initializeApp();
    var data = await FirebaseFirestore.instance
        .collection(type.value)
        .doc(output.value)
        .get();

    print('=================從firestore拿到資料===================');

    url.value = data.data()!['URL'];
    imageURL.value = data.data()!['IMAGE URL'];
    LA.value = data.data()!['Lowest Ask'];
    LS.value = data.data()!['Last Sale'];
    HB.value = data.data()!['Highest Bid'];
  }
}
