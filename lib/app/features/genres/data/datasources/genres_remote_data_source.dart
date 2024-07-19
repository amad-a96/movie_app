import 'package:movie_app/app/core/services/dio_services.dart';
import '../../../../core/constant/api/api.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/genres_list_model.dart';

abstract class GenresRemoteDataSource {
  Future<GenresListModel> getGenresList();
}

class GenresRemoteDataSourceImpl implements GenresRemoteDataSource {
  final DioService dioService;
  GenresRemoteDataSourceImpl({required this.dioService});

  // Genres List
  @override
  Future<GenresListModel> getGenresList() async {
    final response = await dioService.getRequest(Api.baseApi + Api.getGenresList,
        headers: Api.headers);

    if (response.statusCode == 200) {
      return GenresListModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
