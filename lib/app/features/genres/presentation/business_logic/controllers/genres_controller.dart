import 'package:get/get.dart';
import '../../../../../core/helpers/custom_snackbar/custom_snackbar.dart';
import '../../../domain/entities/genres_list_entity.dart';
import '../../../domain/usecases/get_genres_list_uc.dart';

class GenresController extends GetxController {
  static GenresController get to => Get.find();
  final GetGenresListUseCase getGenresListUseCase;
  GenresController({
    required this.getGenresListUseCase,
  });

  final genresListEntity = const GenresListEntity().obs;

  getGenresList() async {
    final result = await getGenresListUseCase.call();
    result.fold(
      (failure) {
        CustomSnackBar.showCustomErrorSnackBar(message: failure.toString());
      },
      (data) {
        genresListEntity.value = data;
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    getGenresList();
  }
}
