import 'package:dio/dio.dart';
import 'package:movie_app/app/core/services/dio_services.dart';
import '../../../../core/constant/api/api.dart';
import '../models/template_model.dart';

abstract class TemplateRemoteDataSource {
  Future<TemplateModel> getTemplate();
}

class TemplateRemoteDataSourceImpl implements TemplateRemoteDataSource {
  final DioService dioService;
  TemplateRemoteDataSourceImpl({required this.dioService});

  @override
  Future<TemplateModel> getTemplate() async {
    try {
      final response = await dioService.getRequest('', headers: Api.headers);

      if (response.statusCode == 200) {
        return TemplateModel.fromJson(response.data);
      } else {
        throw DioException(requestOptions: RequestOptions());
      }
    } catch (e) {
      throw DioException(requestOptions: RequestOptions());
    }
  }
}
