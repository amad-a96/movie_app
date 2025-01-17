import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_app/app/features/genres/presentation/business_logic/bindings/genres_di.dart';
import 'package:movie_app/app/features/home/presentation/pages/home_page.dart';
import 'package:movie_app/app/features/movies/presentation/business_logic/bindings/movie_details_di.dart';
import 'package:movie_app/app/features/movies/presentation/business_logic/bindings/movies_di.dart';
import 'package:movie_app/app/features/movies/presentation/pages/movie_details_page.dart';
import 'package:movie_app/app/features/splash/presentation/business_logic/bindings/splash_di.dart';
import '../features/home/presentation/business_logic/bindings/home_di.dart';
import '../features/search/presentation/business_logic/bindings/search_di.dart';
import '../features/search/presentation/pages/search_page.dart';
import '../features/splash/presentation/page/splash_page.dart';
import 'not_found_screen.dart';
import 'path.dart';

class Pages {
  static final getPages = <GetPage>[
    //not found
    GetPage(
      name: Paths.notFound,
      page: () => const NotFoundPage(),
    ),

    //splash
    GetPage(
      name: Paths.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    //home
    GetPage(
      name: Paths.home,
      page: () => const HomePage(),
      bindings: [
        HomeBinding(),
        GenresBinding(),
        MoviesBinding(),
      ],
    ),

    //movie
    GetPage(
      name: Paths.movieDetails,
      page: () => const MovieDeTailsPage(),
      binding: MovieDetailsBinding(),
    ),

    //search
    GetPage(
      name: Paths.search,
      page: () => const SearchMoviesPage(),
      binding: SearchMoviesBinding(),
    ),
  ];
}
