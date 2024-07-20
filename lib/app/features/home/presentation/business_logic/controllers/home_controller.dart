import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movie_app/app/features/movies/presentation/business_logic/controllers/movies_controller.dart';
import '../../../../../core/controllers/network_checker_controller.dart';
import '../../../../../core/functions/check_remote_fetch.dart';
import '../../../../movies/domain/entities/movie_entity.dart';
import '../../../../movies/domain/entities/result_page_entity.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final PagingController<int, MovieEntity> pagingController =
      PagingController(firstPageKey: 2);
  bool isRemoteFetched = false;
  bool clearCache = false;

  getNewMoviesPage(int pageKey) async {
    try {
      final (ResultPageEntity newResultPage, bool isThisRemoteFetched) =
          await MoviesController.to.getMovies(pageNumber: pageKey);

      isRemoteFetched = isThisRemoteFetched;
      List<MovieEntity> newMovies = newResultPage.results ?? [];

      //break if user is offline and cache is already fetched
      if (pagingController.value.itemList?.last.id == newMovies.last.id &&
          NetworkCheckerController.to.networkInfo.value ==
              InternetConnectionStatus.disconnected) {
        clearCache = true;
        return;
      }
      cleareCache();
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

  void cleareCache() {
    if (clearCache) {
      pagingController.value.itemList?.clear();
      clearCache = false;
    }
  }

  @override
  void onReady() {
    super.onReady();

    getNewMoviesPage(1); //fisrt call to get movies

    pagingController.addPageRequestListener((pageKey) {
      getNewMoviesPage(pageKey);
    });

    ever(
      NetworkCheckerController.to.networkInfo,
      (networkInfo) async {
        if (checkRemoteFetch(isRemoteFetched: isRemoteFetched)) {
          // await Future.sync(
          //   () {
          //     pagingController.value.itemList?.clear();
          //   },
          // );
          getNewMoviesPage(1);
        }
      },
    );
  }
}
