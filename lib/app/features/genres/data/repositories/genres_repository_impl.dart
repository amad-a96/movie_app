import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movie_app/app/features/genres/domain/repositories/genres_repository.dart';
import '../../../../core/controllers/network_checker_controller.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';

import '../datasources/genres_local_data_source.dart';
import '../datasources/genres_remote_data_source.dart';
import '../models/genres_list_model.dart';

class GenresRepositoryImpl implements GenresRepository {
  final GenresRemoteDataSourceImpl remoteDataSource;
  final GenresLocalDataSourceImpl localDataSource;
  final networkInfo = Get.find<NetworkCheckerController>();

  GenresRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, GenresListModel>> getGenresList() async {
    if (networkInfo.networkInfo.value == InternetConnectionStatus.connected) {
      try {
        GenresListModel remoteGenresList =
            await remoteDataSource.getGenresList();

        localDataSource.cacheGenresList(genresListToCache: remoteGenresList);

        return Right(remoteGenresList);
      } on ServerException {
        return Left(
            ServerFailure(errorMessage: 'Failed to get genres, try again'));
      } on DioException {
        return Left(
            ServerFailure(errorMessage: 'Failed to get genres, try again'));
      }
    } else {
      try {
        GenresListModel localTemplate =
            await localDataSource.getLastGenresList();
        return Right(localTemplate);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
