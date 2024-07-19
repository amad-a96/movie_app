import 'dart:convert';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/storage_services.dart';
import '../models/genres_list_model.dart';

abstract class GenresLocalDataSource {
  Future<void> cacheGenresList({required GenresListModel? genresListToCache});
  Future<GenresListModel> getLastGenresList();
}

const cachedGenresList = 'CACHED_GENRESLIST';

class GenresLocalDataSourceImpl implements GenresLocalDataSource {
  final StorageService storageService;

  GenresLocalDataSourceImpl({required this.storageService});

  // Genres List
  @override
  Future<GenresListModel> getLastGenresList() {
    final jsonString = storageService.read(cachedGenresList);

    if (jsonString != null) {
      return Future.value(GenresListModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheGenresList(
      {required GenresListModel? genresListToCache}) async {
    if (genresListToCache != null) {
      storageService.write(
        cachedGenresList,
        json.encode(
          genresListToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
