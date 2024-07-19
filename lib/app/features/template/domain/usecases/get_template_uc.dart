import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/template_entity.dart';
import '../repositories/template_repository.dart';

class GetTemplateUseCase {
  final TemplateRepository templateRepository;

  GetTemplateUseCase({required this.templateRepository});

  Future<Either<Failure, TemplateEntity>> call() async {
    return await templateRepository.getTemplate();
  }
}
