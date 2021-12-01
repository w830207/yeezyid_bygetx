import 'package:get/get.dart';
import 'package:yeezyid_bygetx/app/page/answerPage.dart';
import 'package:yeezyid_bygetx/app/page/home.dart';
import 'package:yeezyid_bygetx/app/page/putImagePage.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Home;

  static final routes = [
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      children: [
        GetPage(
          name: AppRoutes.Camera,
          page: () => PutImagePage(),
          children: [GetPage(name: AppRoutes.Answer, page: () => AnswerPage())],
        )
      ],
    ),
  ];
}
