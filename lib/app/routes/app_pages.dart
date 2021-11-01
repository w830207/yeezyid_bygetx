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
      page: () => home(),
      children: [
        GetPage(
          name: AppRoutes.Camera,
          page: () => putImagePage(),
          children: [
            GetPage(
                name: AppRoutes.Answer,
                page: () => answerPage()
            )
          ],
        )
      ],
    ),
  ];
}
