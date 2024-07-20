import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../../../core/controllers/network_checker_controller.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/movies_repository.dart';
import '../datasources/movies_local_data_source.dart';
import '../datasources/movies_remote_data_source.dart';

import '../models/result_page_model.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSourceImpl remoteDataSource;
  final MoviesLocalDataSourceImpl localDataSource;
  final networkInfo = Get.find<NetworkCheckerController>();

  MoviesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, ResultPageModel>> getMovies(
      {required int pageNumber}) async {
    if (networkInfo.networkInfo.value == InternetConnectionStatus.connected) {
      try {
        ResultPageModel remoteMovies =
            await remoteDataSource.getMovies(pageNumber: pageNumber);

        localDataSource.cacheMovies(moviesToCache: remoteMovies);

        return Right(remoteMovies);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        ResultPageModel localMovies = await localDataSource.getLastMovies();
        return Right(localMovies);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
