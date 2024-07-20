import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../core/common_widgets/image_container_widget.dart';
import '../../../../core/constant/api/api.dart';
import '../../../../routing/path.dart';
import '../../../movies/domain/entities/movie_entity.dart';
import '../business_logic/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedListView<int, MovieEntity>(
        pagingController: HomeController.to.pagingController,
        builderDelegate: PagedChildBuilderDelegate<MovieEntity>(
            itemBuilder: (context, movie, index) => InkWell(
                  onTap: () {
                    Get.toNamed(Paths.movieDetails, arguments: movie.id);
                  },
                  child: Row(
                    children: [
                      ImageContainerWidget(
                          width: 70,
                          height: 70,
                          imgUrl: '${Api.imagePath}${movie.backdropPath}'),
                      const SizedBox(width: 10),
                      Text(
                        movie.title ?? '',
                        style: Get.textTheme.bodyLarge,
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
