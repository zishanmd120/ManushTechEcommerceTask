import 'package:ecom_zishan/features/base/presentation/bindings/base_bindings.dart';
import 'package:ecom_zishan/features/base/presentation/presentation/first_screen.dart';
import 'package:ecom_zishan/features/cart/presentation/binding/cart_binding.dart';
import 'package:ecom_zishan/features/home/presentation/ui/home_screen.dart';
import 'package:ecom_zishan/features/login/presentation/binding/auth_bindings.dart';
import 'package:ecom_zishan/features/login/presentation/ui/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../features/cart/presentation/ui/cart_screen.dart';
import '../../features/home/presentation/bindings/home_binding.dart';
import '../routes/app_routes.dart';

class AppPages {

  static final pages = [

    GetPage(
      name: AppRoutes.first,
      page: () => FirstScreen(),
      binding: BaseBindings(),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: AuthBindings(),
    ),

    GetPage(
      name: AppRoutes.dashboard,
      page: () => const HomeScreen(),
      bindings: [
        HomeBindings(),
        CartBindings(),
      ]
    ),

    GetPage(
      name: AppRoutes.cart,
      page: () => const CartScreen(),
      binding: CartBindings(),
    ),

  ];

}