import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/config/app_config.dart';
import 'app/routes/app_pages.dart';
import 'app/widgets/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const QTIApps()),
  );
}

class QTIApps extends StatefulWidget {
  const QTIApps({Key? key}) : super(key: key);

  @override
  State<QTIApps> createState() => _QTIAppsState();
}

class _QTIAppsState extends State<QTIApps> {
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: Future.delayed(const Duration(seconds: 1)),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.cupertino,
    );
    //   }
    //   return const SplashScreen();
    // },
    // );
  }
}
