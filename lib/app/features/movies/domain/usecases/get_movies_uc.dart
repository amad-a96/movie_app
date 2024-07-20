import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/result_page_entity.dart';
import '../repositories/movies_repository.dart';

class GetMoviesUseCase {
  final MoviesRepository moviesRepository;

  GetMoviesUseCase({required this.moviesRepository});

  Future<Either<Failure, ResultPageEntity>> call(
      {required int pageNumber}) async {
    return await moviesRepository.getMovies(pageNumber: pageNumber);
  }
}
