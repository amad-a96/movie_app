import 'package:get/get_navigation/src/routes/get_route.dart';
import '../features/splash/presentation/page/splash_page.dart';
import 'not_found_screen.dart';
import 'path.dart';

class Pages {
  static final getPages = <GetPage>[
    //not found
    GetPage(
      name: Paths.notFound,
      page: () => const NotFoundPage(),
    ),

    //splash
    GetPage(
      name: Paths.splash,
      page: () => const SplashPage(),
      // binding: AuthBinding(),
    ),
  ];
}
