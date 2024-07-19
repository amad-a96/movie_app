import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/genres_list_entity.dart';
import '../repositories/genres_repository.dart';

class GetGenresListUseCase {
  final GenresRepository moviesRepository;

  GetGenresListUseCase({required this.moviesRepository});

  Future<Either<Failure, GenresListEntity>> call() async {
    return await moviesRepository.getGenresList();
  }
}
