import 'dart:convert';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/storage_services.dart';
import '../models/template_model.dart';

abstract class TemplateLocalDataSource {
  Future<void> cacheTemplate({required TemplateModel? templateToCache});
  Future<TemplateModel> getLastTemplate();
}

const cachedTemplate = 'CACHED_TEMPLATE';

class TemplateLocalDataSourceImpl implements TemplateLocalDataSource {
  final StorageService storageService;

  TemplateLocalDataSourceImpl({required this.storageService});

  @override
  Future<TemplateModel> getLastTemplate() {
    final jsonString = storageService.read(cachedTemplate);

    if (jsonString != null) {
      return Future.value(TemplateModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheTemplate({required TemplateModel? templateToCache}) async {
    if (templateToCache != null) {
      storageService.write(
        cachedTemplate,
        json.encode(
          templateToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
