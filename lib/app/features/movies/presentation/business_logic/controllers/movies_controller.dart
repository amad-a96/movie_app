import 'package:get/get.dart';
import '../../../../../core/functions/check_remote_fetch.dart';
import '../../../../../core/helpers/custom_snackbar/custom_snackbar.dart';
import '../../../domain/entities/result_page_entity.dart';
import '../../../domain/usecases/get_movies_uc.dart';

class MoviesController extends GetxController {
  static MoviesController get to => Get.find();
  final GetMoviesUseCase getMoviesUseCase;
  MoviesController({
    required this.getMoviesUseCase,
  });
  final resultPageEntity = const ResultPageEntity().obs;
  bool isRemoteFetched = false;

  Future<(ResultPageEntity, bool)> getMovies({required int pageNumber}) async {
    await Future.sync(
      () async {
        final result = await getMoviesUseCase.call(pageNumber: pageNumber);
        result.fold(
          (failure) {
            CustomSnackBar.showCustomErrorSnackBar(message: failure.toString());
          },
          (data) {
            isRemoteFetched =
                checkRemoteFetch(isRemoteFetched: isRemoteFetched);
            resultPageEntity.value = data;
          },
        );
      },
    );

    return (resultPageEntity.value, isRemoteFetched);
  }
}
