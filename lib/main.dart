import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/home_page.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.DASHBOARD,
      getPages: AppPages.list,
      locale: const Locale("en", "US"),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      fallbackLocale: const Locale('en', 'US'),
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
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
