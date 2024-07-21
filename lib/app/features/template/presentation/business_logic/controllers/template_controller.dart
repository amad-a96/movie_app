import 'package:get/get.dart';

import '../../../../../core/helpers/custom_snackbar/custom_snackbar.dart';
import '../../../domain/usecases/get_template_uc.dart';

class TemplateController extends GetxController {
  static TemplateController get to => Get.find();

  final GetTemplateUseCase getTemplateUseCase;

  TemplateController({
    required this.getTemplateUseCase,
  });

  @override
  void onReady() async {
    super.onReady();
    final result = await getTemplateUseCase.call();
    result.fold(
      (failure) {
        CustomSnackBar.showCustomErrorSnackBar(message: failure.errorMessage);
      },
      (data) {
        print(data);
      },
    );
  }
}
