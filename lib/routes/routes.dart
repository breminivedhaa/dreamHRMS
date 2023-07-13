import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screen/splash.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => Splash(),
    ),
    GetPage(
      name: '/login',
      page: () => Splash(),
    ),
  ];
}
