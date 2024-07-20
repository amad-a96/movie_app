import 'package:movie_app/app/core/services/dio_services.dart';
import '../../../../core/constant/api/api.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/result_page_model.dart';

abstract class MoviesRemoteDataSource {
  Future<ResultPageModel> getMovies({required int pageNumber});
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final DioService dioService;
  MoviesRemoteDataSourceImpl({required this.dioService});

  @override
  Future<ResultPageModel> getMovies({required int pageNumber}) async {
    final response = await dioService.getRequest(
        '${Api.baseApi}${Api.getTrendingMovies}$pageNumber',
        headers: Api.headers);

    if (response.statusCode == 200) {
      return ResultPageModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
