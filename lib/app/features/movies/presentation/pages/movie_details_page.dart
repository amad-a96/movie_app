import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:movie_app/app/core/constant/color_manager.dart';
import 'package:movie_app/app/features/genres/domain/entities/genre_entity.dart';
import 'package:movie_app/app/features/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_app/app/features/movies/presentation/business_logic/controllers/movie_details_controller.dart';
import 'package:intl/intl.dart';
import '../../../../core/common_widgets/custom_background.dart';
import '../../../../core/common_widgets/image_container_widget.dart';
import '../../../../core/constant/api/api.dart';
import '../../../../core/entities/spoken_language_entity.dart';
import '../../../genres/presentation/business_logic/controllers/genres_controller.dart';

class MovieDeTailsPage extends GetView<MovieDetailsController> {
  const MovieDeTailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CustomBackground(
        child: Obx(() {
          final movie = controller.movieDetailsEntity.value;
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Stack(
                children: [
                  ImageContainerWidget(
                      width: Get.width,
                      height: 200,
                      fit: BoxFit.cover,
                      imgUrl: '${Api.imagePath}${movie.backdropPath}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: ColorManager.white,
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  movie.title ?? '',
                  style: Get.textTheme.headlineSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GenresWidget(movie),
                    const SizedBox(
                      height: 20,
                    ),
                    SpokenLangWidget(movie),
                    const SizedBox(
                      height: 20,
                    ),
                    budegAndRevenueWidget(movie),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      movie.overview ?? '',
                      style: Get.textTheme.bodyMedium!
                          .copyWith(color: ColorManager.white.withOpacity(0.7)),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Row budegAndRevenueWidget(MovieDetailsEntity movie) {
    return Row(
      children: [
        Column(
          children: [
            Text('budget',
                style: Get.textTheme.bodyMedium!
                    .copyWith(color: ColorManager.white)),
            Text(
                // ignore: prefer_interpolation_to_compose_strings
                MoneyFormatter(amount: movie.budget?.toDouble() ?? 0)
                        .output
                        .withoutFractionDigits +
                    ' \$',
                // textDirection: TextDirection.ltr,
                style: Get.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700, color: ColorManager.grey)),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Text('revenue',
                style: Get.textTheme.bodyMedium!
                    .copyWith(color: ColorManager.white)),
            Text(
                // ignore: prefer_interpolation_to_compose_strings
                MoneyFormatter(amount: movie.revenue?.toDouble() ?? 0)
                        .output
                        .withoutFractionDigits +
                    ' \$',
                // textDirection: TextDirection.ltr,
                style: Get.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700, color: ColorManager.grey)),
          ],
        ),
      ],
    );
  }

  Row SpokenLangWidget(MovieDetailsEntity movie) {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (SpokenLanguageEntity spokenLanguage
                in movie.spokenLanguages ?? []) ...[
              Text(
                spokenLanguage.englishName ?? '',
                style: Get.textTheme.labelLarge,
              ),
              const SizedBox(
                width: 1,
              ),
            ],
          ],
        ),
        const Spacer(),
        Text(
          DateFormat('dd MMM yyyy')
              .format(DateTime.parse(movie.releaseDate ?? '1970-01-01')),
          style: Get.textTheme.labelLarge,
        ),
      ],
    );
  }

  Row GenresWidget(MovieDetailsEntity movie) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (GenreEntity genre in movie.genres ?? []) ...[
          Text(
            GenresController.to.getGenreById(genreId: genre.id ?? 0),
            style: Get.textTheme.labelLarge,
          ),
          if (movie.genres?.last.id != genre.id)
            Text(
              ', ',
              style: Get.textTheme.labelLarge,
            ),
        ],
      ],
    );
  }
}
