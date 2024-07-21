import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/features/home/presentation/business_logic/controllers/home_controller.dart';

import '../../../../movies/domain/entities/movie_entity.dart';

class SearchMoviesController extends GetxController {
  static SearchMoviesController get to => Get.find();

  final searchedMovies = <MovieEntity>[].obs;
  final searchedMoviesName = <String>[].obs;
  final allMovies = <MovieEntity>[].obs;
  final allMoviesName = <String>[].obs;
  final searchCtrl = TextEditingController();
  final searchedText = ''.obs;
  onTyping({required String text}) {
    searchedText.value = text;
  }

  search({required String text}) {
    for (String movieName in allMoviesName) {
      if (movieName.toLowerCase().contains(text.toLowerCase())) {
        searchedMoviesName.add(movieName);
      }
    }

    getMoviesEntityByName(moviesName: searchedMoviesName);
    searchedMoviesName.clear();
  }

  getMoviesEntityByName({required List<String> moviesName}) {
    searchedMovies.clear();
    for (String movieName in moviesName) {
      MovieEntity? movieEntity = allMovies.firstWhereOrNull(
        (movie) => movie.title == movieName,
      );

      if (movieEntity?.id != null) {
        searchedMovies.add(movieEntity!);
      }
    }
  }

  getMoviesName() async {
    await Future.sync(
      () {
        allMovies.addAll(HomeController.to.pagingController.value.itemList
            as List<MovieEntity>);
      },
    );

    for (MovieEntity movie in allMovies) {
      allMoviesName.add(movie.title ?? '');
    }
  }

  @override
  void onReady() {
    super.onReady();
    getMoviesName();
    debounce(
      searchedText,
      (text) {
        if (text.isNotEmpty) {
          search(text: text);
        }
      },
    );
  }
}
