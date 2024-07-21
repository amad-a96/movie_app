import 'package:get/get.dart';
import '../../../../../core/helpers/custom_snackbar/custom_snackbar.dart';
import '../../../domain/entities/movie_details_entity.dart';
import '../../../domain/usecases/get_movie_details_uc.dart';

class MovieDetailsController extends GetxController {
  static MovieDetailsController get to => Get.find();
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  MovieDetailsController({
    required this.getMovieDetailsUseCase,
  });
  final movieDetailsEntity = const MovieDetailsEntity().obs;

  getMovieDetails({required int movieId}) async {
    await Future.sync(
      () async {
        final result = await getMovieDetailsUseCase.call(movieId: movieId);
        result.fold(
          (failure) {
            CustomSnackBar.showCustomErrorSnackBar(message: failure.errorMessage);
          },
          (data) {
            movieDetailsEntity.value = data;
            print(data);
          },
        );
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    getMovieDetails(movieId: Get.arguments);
  }
}
