import 'package:dartz/dartz.dart';
import 'package:movie_app/app/features/movies/domain/entities/movie_details_entity.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/movies_repository.dart';

class GetMovieDetailsUseCase {
  final MoviesRepository moviesRepository;

  GetMovieDetailsUseCase({required this.moviesRepository});

  Future<Either<Failure, MovieDetailsEntity>> call(
      {required int movieId}) async {
    return await moviesRepository.getMovieDetails(movieId: movieId);
  }
}
