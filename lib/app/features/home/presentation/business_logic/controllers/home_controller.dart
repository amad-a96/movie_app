import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/app/features/movies/presentation/business_logic/controllers/movies_controller.dart';
import '../../../../movies/domain/entities/movie_entity.dart';
import '../../../../movies/domain/entities/result_page_entity.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final PagingController<int, MovieEntity> pagingController =
      PagingController(firstPageKey: 2);

  Future<void> getNewMoviesPage(int pageKey) async {
    try {
      ResultPageEntity newResultPage =
          await MoviesController.to.getMovies(pageNumber: pageKey);
      List<MovieEntity> newMovies = newResultPage.results ?? [];

      final isLastPage = newResultPage.totalPages == pageKey;
      if (isLastPage) {
        pagingController.appendLastPage(newMovies);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newMovies, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void onReady() {
    super.onReady();

    getNewMoviesPage(1); //fisrt call to get movies

    pagingController.addPageRequestListener((pageKey) {
      getNewMoviesPage(pageKey);
    });
  }
}
