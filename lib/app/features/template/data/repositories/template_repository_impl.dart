import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../../../core/controllers/network_checker_controller.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/template_repository.dart';
import '../datasources/template_local_data_source.dart';
import '../datasources/template_remote_data_source.dart';
import '../models/template_model.dart';

class TemplateRepositoryImpl implements TemplateRepository {
  final TemplateRemoteDataSourceImpl remoteDataSource;
  final TemplateLocalDataSourceImpl localDataSource;
  final networkInfo = Get.find<NetworkCheckerController>();

  TemplateRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, TemplateModel>> getTemplate() async {
    if (networkInfo.networkInfo.value == InternetConnectionStatus.connected) {
      try {
        TemplateModel remoteTemplate = await remoteDataSource.getTemplate();

        localDataSource.cacheTemplate(templateToCache: remoteTemplate);

        return Right(remoteTemplate);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'Failed to get template, try again'));
      } on DioException {
        return Left(ServerFailure(errorMessage: 'Failed to get template, try again'));
      }
    } else {
      try {
        TemplateModel localTemplate = await localDataSource.getLastTemplate();
        return Right(localTemplate);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
