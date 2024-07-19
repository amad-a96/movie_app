import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/genres_list_entity.dart';

abstract class GenresRepository {
  Future<Either<Failure, GenresListEntity>> getGenresList();
}
