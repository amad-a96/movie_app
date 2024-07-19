import 'package:get/get.dart';
import 'package:movie_app/app/core/controllers/network_checker_controller.dart';

import '../../../../../core/helpers/custom_snackbar/custom_snackbar.dart';
import '../../../domain/usecases/get_genres_list_uc.dart';

class GenresController extends GetxController {
  static GenresController get to => Get.find();

  final GetGenresListUseCase getGenresListUseCase;

  GenresController({
    required this.getGenresListUseCase,
  });

  @override
  void onInit() async {
    super.onInit();
    once(
      NetworkCheckerController.to.networkInfo,
      (networkInfo) async {
        final result = await getGenresListUseCase.call();
        result.fold(
          (failure) {
            CustomSnackBar.showCustomErrorSnackBar(message: failure.toString());
          },
          (data) {
            print(data);
          },
        );
      },
    );
  }
}
