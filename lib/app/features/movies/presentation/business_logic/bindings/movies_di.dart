import 'package:get/get.dart';
import 'package:movie_app/app/features/movies/data/datasources/movies_local_data_source.dart';
import '../../../data/datasources/movies_remote_data_source.dart';
import '../../../data/repositories/movies_repository_impl.dart';
import '../../../domain/repositories/movies_repository.dart';
import '../../../domain/usecases/get_movies_uc.dart';
import '../controllers/movies_controller.dart';

class MoviesBinding implements Bindings {
  @override
  void dependencies() {
    // //remote data source Impl
    // Get.lazyPut(() => MoviesRemoteDataSourceImpl(dioService: Get.find()));

    // //local data source Impl
    // Get.lazyPut(() => MoviesLocalDataSourceImpl(storageService: Get.find()));

    // //Repository
    // Get.lazyPut(() => MoviesRepositoryImpl(
    //       remoteDataSource: Get.find(),
    //       localDataSource: Get.find(),
    //     ));

    // Get.lazyPut<MoviesRepository>(() => MoviesRepositoryImpl(
    //     remoteDataSource: Get.find(), localDataSource: Get.find()));

    // //use cases
    // Get.lazyPut<GetMoviesUseCase>(
    //     () => GetMoviesUseCase(moviesRepository: Get.find()));

    // //controllers
    // Get.lazyPut<MoviesController>(
    //   () => MoviesController(
    //     getMoviesUseCase: Get.find(),
    //   ),
    // );

    // *put
    //remote data source Impl
    Get.put<MoviesRemoteDataSourceImpl>(
        MoviesRemoteDataSourceImpl(dioService: Get.find()));

    //local data source Impl
    Get.put<MoviesLocalDataSourceImpl>(
        MoviesLocalDataSourceImpl(storageService: Get.find()));

    //Repository
    Get.put<MoviesRepositoryImpl>(MoviesRepositoryImpl(
      remoteDataSource: Get.find(),
      localDataSource: Get.find(),
    ));

    Get.put<MoviesRepository>(MoviesRepositoryImpl(
        remoteDataSource: Get.find(), localDataSource: Get.find()));

    //use cases
    Get.put<GetMoviesUseCase>(
        GetMoviesUseCase(moviesRepository: Get.find()));

    //controllers
    Get.put<MoviesController>(
      MoviesController(
        getMoviesUseCase: Get.find(),
      ),
    );
  }
}
