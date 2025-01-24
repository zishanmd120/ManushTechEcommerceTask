import 'package:ecom_zishan/features/base/caching/hive_cache_config.dart';
import 'package:ecom_zishan/main/pages/app_pages.dart';
import 'package:ecom_zishan/main/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/base/presentation/bindings/base_bindings.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.put<SharedPreferences>(sharedPreferences);
  await HiveCacheConfig().initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BaseBindings(),
      initialRoute: AppRoutes.first,
      getPages: AppPages.pages,
    );
  }
}

