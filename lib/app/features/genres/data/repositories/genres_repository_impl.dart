import 'package:dartz/dartz.dart';
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
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
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

  // @override
  // Future<Either<Failure, TemplateModel>> getTemplate(
  //     {required TemplateParams templateParams}) async {
  //   if (networkInfo.networkInfo.value == InternetConnectionStatus.connected) {
  //     try {
  //       TemplateModel remoteTemplate =
  //           await remoteDataSource.getTemplate(templateParams: templateParams);

  //       localDataSource.cacheTemplate(templateToCache: remoteTemplate);

  //       return Right(remoteTemplate);
  //     } on ServerException {
  //       return Left(ServerFailure(errorMessage: 'This is a server exception'));
  //     }
  //   } else {
  //     try {
  //       TemplateModel localTemplate = await localDataSource.getLastTemplate();
  //       return Right(localTemplate);
  //     } on CacheException {
  //       return Left(CacheFailure(errorMessage: 'This is a cache exception'));
  //     }
  //   }
  // }
}
