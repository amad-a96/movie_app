import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/core/constant/color_manager.dart';
import 'package:intl/intl.dart';
import '../../../../core/common_widgets/image_container_widget.dart';
import '../../../../core/constant/api/api.dart';
import '../../../../routing/path.dart';
import '../../../genres/presentation/business_logic/controllers/genres_controller.dart';
import '../../../movies/domain/entities/movie_entity.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    super.key,
    required this.movie,
  });
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Paths.movieDetails, arguments: movie.id);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ImageContainerWidget(
                    width: Get.width,
                    height: 200,
                    fit: BoxFit.cover,
                    imgUrl: '${Api.imagePath}${movie.backdropPath}'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        movie.title ?? '',
                        style: Get.textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int genreId in movie.genreIds ?? []) ...[
                            Text(
                              GenresController.to
                                  .getGenreById(genreId: genreId),
                              style: Get.textTheme.labelLarge,
                            ),
                            if (movie.genreIds?.last != genreId)
                              Text(
                                ', ',
                                style: Get.textTheme.labelLarge,
                              ),
                          ],
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            movie.originalLanguage ?? '',
                            style: Get.textTheme.labelLarge,
                          ),
                          const Spacer(),
                          Text(
                            DateFormat('yyyy').format(
                                DateTime.parse(movie.releaseDate ?? '')),
                            style: Get.textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: ColorManager.lightGrey.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
