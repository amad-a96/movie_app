import 'package:get/get.dart';
import 'package:movie_app/app/core/controllers/network_checker_controller.dart';
import '../../../../../core/functions/check_remote_fetch.dart';
import '../../../../../core/helpers/custom_snackbar/custom_snackbar.dart';
import '../../../domain/entities/genres_list_entity.dart';
import '../../../domain/usecases/get_genres_list_uc.dart';

class GenresController extends GetxController {
  static GenresController get to => Get.find();
  final GetGenresListUseCase getGenresListUseCase;
  GenresController({
    required this.getGenresListUseCase,
  });
  bool isRemoteFetched = false;
  final genresListEntity = const GenresListEntity().obs;

  getGenresList() async {
    final result = await getGenresListUseCase.call();
    result.fold(
      (failure) {
        CustomSnackBar.showCustomErrorSnackBar(message: failure.errorMessage);
      },
      (data) {
        isRemoteFetched = checkRemoteFetch(isRemoteFetched: isRemoteFetched);
        genresListEntity.value = data;
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    getGenresList();

    ever(
      NetworkCheckerController.to.networkInfo,
      (networkInfo) {
        if (checkRemoteFetch(isRemoteFetched: isRemoteFetched)) {
          getGenresList();
        }
      },
    );
  }
}
