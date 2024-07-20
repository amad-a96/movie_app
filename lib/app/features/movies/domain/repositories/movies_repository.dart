import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/result_page_entity.dart';

abstract class MoviesRepository {
  Future<Either<Failure, ResultPageEntity>> getMovies(
      {required int pageNumber});
}
