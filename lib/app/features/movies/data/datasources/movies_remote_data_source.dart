import 'package:dio/dio.dart';
import 'package:movie_app/app/core/services/dio_services.dart';
import 'package:movie_app/app/features/movies/data/models/movie_details_model.dart';
import '../../../../core/constant/api/api.dart';
import '../models/result_page_model.dart';

abstract class MoviesRemoteDataSource {
  Future<ResultPageModel> getMovies({required int pageNumber});
  Future<MovieDetailsModel> getMovieDetails({required int movieId});
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final DioService dioService;
  MoviesRemoteDataSourceImpl({required this.dioService});

  @override
  Future<ResultPageModel> getMovies({required int pageNumber}) async {
    try {
      final response = await dioService.getRequest(
          '${Api.baseApi}${Api.getTrendingMovies}$pageNumber',
          headers: Api.headers);

      if (response.statusCode == 200) {
        return ResultPageModel.fromJson(response.data);
      } else {
        throw DioException(requestOptions: RequestOptions());
      }
    } catch (e) {
      throw DioException(requestOptions: RequestOptions());
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails({required int movieId}) async {
    try {
      final response = await dioService.getRequest(
          '${Api.baseApi}${Api.getMovieDetails}$movieId',
          headers: Api.headers);

      if (response.statusCode == 200) {
        return MovieDetailsModel.fromJson(response.data);
      } else {
        throw DioException(requestOptions: RequestOptions());
      }
    } catch (e) {
      throw DioException(requestOptions: RequestOptions());
    }
  }
}
