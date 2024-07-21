import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/common_widgets/custom_background.dart';
import '../../../../core/common_widgets/custom_text_form_field.dart';
import '../../../../core/constant/color_manager.dart';
import '../../../home/presentation/widgets/movie_card_widget.dart';
import '../business_logic/controllers/search_controller.dart';

class SearchMoviesPage extends GetView<SearchMoviesController> {
  const SearchMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: CustomBackground(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomFormField(
                        autofocus: true,
                        controller: controller.searchCtrl,
                        onChanged: (text) {
                          controller.onTyping(text: text);
                        },
                        keyboardType: TextInputType.name,
                        hintText: 'Search here...',
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorManager.green.withOpacity(0.8),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Cancel',
                          style: Get.textTheme.bodyLarge,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() => ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.searchedMovies.length,
                      itemBuilder: (context, index) {
                        return MovieCardWidget(
                          movie: controller.searchedMovies[index],
                        );
                      },
                    )),
              ),
            ],
          ),
        ));
  }
}
