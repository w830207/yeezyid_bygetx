import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeezyid_bygetx/app/routes/app_pages.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app/controller/controller.dart';

void main() {
  SentryFlutter.init(
    (options) {
      options.dsn =
          'https://eeb2940cb993471499b15f4ed9cbc7d2@o1078331.ingest.sentry.io/6088883';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () {
      Get.put(Controller());
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
