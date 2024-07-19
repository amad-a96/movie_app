import 'package:get/get.dart';
import 'package:movie_app/app/features/template/data/datasources/template_local_data_source.dart';
import '../../../data/datasources/template_remote_data_source.dart';
import '../../../data/repositories/template_repository_impl.dart';
import '../../../domain/repositories/template_repository.dart';
import '../../../domain/usecases/get_template_uc.dart';
import '../controllers/template_controller.dart';

class TemplateBinding implements Bindings {
  @override
  void dependencies() {
    //remote data source Impl
    Get.lazyPut(() => TemplateRemoteDataSourceImpl(dioService: Get.find()));

    //local data source Impl
    Get.lazyPut(() => TemplateLocalDataSourceImpl(storageService: Get.find()));

    //Repository
    Get.lazyPut(() => TemplateRepositoryImpl(
          remoteDataSource: Get.find(),
          localDataSource: Get.find(),
        ));

    Get.lazyPut<TemplateRepository>(() => TemplateRepositoryImpl(
        remoteDataSource: Get.find(), localDataSource: Get.find()));

    //use cases
    Get.lazyPut<GetTemplateUseCase>(
        () => GetTemplateUseCase(templateRepository: Get.find()));

    //controllers
    Get.lazyPut<TemplateController>(
      () => TemplateController(
        getTemplateUseCase: Get.find(),
      ),
    );

    //*put
    // //remote data source Impl
    // Get.put<TemplateRemoteDataSourceImpl>(
    //     TemplateRemoteDataSourceImpl(dioService: Get.find()));

    // //local data source Impl
    // Get.put<TemplateLocalDataSourceImpl>(
    //     TemplateLocalDataSourceImpl(storageService: Get.find()));

    // //Repository
    // Get.put<TemplateRepositoryImpl>(TemplateRepositoryImpl(
    //   remoteDataSource: Get.find(),
    //   localDataSource: Get.find(),
    // ));

    // Get.put<TemplateRepository>(TemplateRepositoryImpl(
    //     remoteDataSource: Get.find(), localDataSource: Get.find()));

    // //use cases
    // Get.put<GetTemplateUseCase>(
    //     GetTemplateUseCase(templateRepository: Get.find()));

    // //controllers
    // Get.put<TemplateController>(
    //   TemplateController(
    //     getTemplateUseCase: Get.find(),
    //   ),
    // );
  }
}
