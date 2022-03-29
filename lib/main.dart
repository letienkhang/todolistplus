import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/home_page.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'themes/app_theme.dart';
import 'utils/exports.dart';
import 'utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Get.isDarkMode ? Brightness.dark : Brightness.light,
        statusBarBrightness:
            Get.isDarkMode ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness:
            Get.isDarkMode ? Brightness.dark : Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    return ScreenUtilInit(
        designSize: const Size(360, 784),
        builder: () {
          return GetMaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            initialRoute: AppRoutes.DASHBOARD,
            getPages: AppPages.list,
            color: Colors.white,
            debugShowCheckedModeBanner: false,
            fallbackLocale: const Locale('en', 'US'),
            theme: CustomTheme.buildLightTheme(),
            darkTheme: CustomTheme.buildDarkTheme(),
            // themeMode: ThemeMode.system,
          );
        });
  }
}

// void main() {
//   // setupMainDeps();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'To-do List',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         initialRoute: '$HomePage',
//         routes: {
//           '$HomePage': (_) => const HomePage(),
//         }
//     );
//   }
// }
