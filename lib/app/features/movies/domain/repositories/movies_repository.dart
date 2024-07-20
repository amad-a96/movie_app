import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/movie_details_entity.dart';
import '../entities/result_page_entity.dart';

abstract class MoviesRepository {
  Future<Either<Failure, ResultPageEntity>> getMovies(
      {required int pageNumber});

  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      {required int movieId});
}
