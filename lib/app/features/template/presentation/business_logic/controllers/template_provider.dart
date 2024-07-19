import 'package:get/get.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/template_entity.dart';

class TemplateController extends GetxController {
  static TemplateController get to => Get.find();

  TemplateEntity? template;
  Failure? failure;

  TemplateController({
    this.template,
    this.failure,
  });
}
