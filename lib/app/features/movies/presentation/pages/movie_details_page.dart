import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movie_app/app/features/movies/presentation/business_logic/controllers/movie_details_controller.dart';

class MovieDeTailsPage extends GetView<MovieDetailsController> {
  const MovieDeTailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(controller.movieDetailsEntity.value.title ?? '')),
      ),
    );
  }
}
