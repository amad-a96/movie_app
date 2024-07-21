import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/app/core/constant/color_manager.dart';
import '../../../../core/common_widgets/custom_background.dart';
import '../../../../core/common_widgets/custom_text_form_field.dart';
import '../../../movies/domain/entities/movie_entity.dart';
import '../business_logic/controllers/home_controller.dart';
import '../widgets/movie_card_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CustomBackground(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomFormField(
                    readOnly: true,
                    onTap: () {},
                    hintText: 'Search here...',
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorManager.green.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PagedListView<int, MovieEntity>(
                physics: const BouncingScrollPhysics(),
                pagingController: HomeController.to.pagingController,
                builderDelegate: PagedChildBuilderDelegate<MovieEntity>(
                    itemBuilder: (context, movie, index) => MovieCardWidget(
                          movie: movie,
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
