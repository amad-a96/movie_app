import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchMoviesBinding implements Bindings {
  @override
  void dependencies() {
    //controllers
    Get.lazyPut<SearchMoviesController>(
      () => SearchMoviesController(),
    );
  }
}
