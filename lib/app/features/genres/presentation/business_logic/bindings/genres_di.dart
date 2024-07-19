import 'package:get/get.dart';
import '../../../data/datasources/genres_local_data_source.dart';
import '../../../data/datasources/genres_remote_data_source.dart';
import '../../../data/repositories/genres_repository_impl.dart';
import '../../../domain/repositories/genres_repository.dart';
import '../../../domain/usecases/get_genres_list_uc.dart';
import '../controllers/genres_controller.dart';

class GenresBinding implements Bindings {
  @override
  void dependencies() {
    // //remote data source Impl
    // Get.lazyPut(() => GenresRemoteDataSourceImpl());

    // //Repository
    // Get.lazyPut(() => GenresRepositoryImpl(
    //       remoteDataSource: Get.find(),
    //       localDataSource: Get.find(),
    //     ));

    // Get.lazyPut<GenresRepository>(() => GenresRepositoryImpl(
    //     remoteDataSource: Get.find(), localDataSource: Get.find()));

    // //use cases
    // Get.lazyPut<GetGenresListUseCase>(
    //     () => GetGenresListUseCase(moviesRepository: Get.find()));

    // //controllers
    // Get.lazyPut<GenresController>(
    //   () => GenresController(
    //     getGenresListUseCase: Get.find(),

    //   ),
    // );

    //remote data source Impl
    Get.put<GenresRemoteDataSourceImpl>(
        GenresRemoteDataSourceImpl(dioService: Get.find()));

    //local data source Impl
    Get.put<GenresLocalDataSourceImpl>(
        GenresLocalDataSourceImpl(storageService: Get.find()));

    //Repository
    Get.put<GenresRepositoryImpl>(GenresRepositoryImpl(
      remoteDataSource: Get.find(),
      localDataSource: Get.find(),
    ));

    Get.put<GenresRepository>(GenresRepositoryImpl(
        remoteDataSource: Get.find(), localDataSource: Get.find()));

    //use cases
    Get.put<GetGenresListUseCase>(
        GetGenresListUseCase(moviesRepository: Get.find()));

    //controllers
    Get.put<GenresController>(
      GenresController(
        getGenresListUseCase: Get.find(),
      ),
    );
  }
}
