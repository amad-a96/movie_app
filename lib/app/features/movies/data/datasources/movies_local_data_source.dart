import 'dart:convert';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/storage_services.dart';
import '../models/result_page_model.dart';

abstract class MoviesLocalDataSource {
  Future<void> cacheMovies({required ResultPageModel? moviesToCache});
  Future<ResultPageModel> getLastMovies();
}

const cachedMovies = 'CACHED_MOVIES';

class MoviesLocalDataSourceImpl implements MoviesLocalDataSource {
  final StorageService storageService;

  MoviesLocalDataSourceImpl({required this.storageService});

  @override
  Future<ResultPageModel> getLastMovies() {
    final jsonString = storageService.read(cachedMovies);

    if (jsonString != null) {
      return Future.value(ResultPageModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheMovies({required ResultPageModel? moviesToCache}) async {
    if (moviesToCache != null) {
      storageService.write(
        cachedMovies,
        json.encode(
          moviesToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
