class Api {
  static const baseApi = 'https://api.themoviedb.org/3/';
  static const key =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYTJiZGY3YTY5NGU5OGIxMjdkYWE4ODBhN2JhZjEzNSIsIm5iZiI6MTcyMTQwMTc2OS42MTUzNjIsInN1YiI6IjY2OWE4MDUwODMwYzgwZGUwYjNjMzk3NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cnIyy5qW24flLg429Vjjt_4mjCqM-vnuM7ILNYco-FQ';
  static const Map<String, String> headers = {
    'accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYTJiZGY3YTY5NGU5OGIxMjdkYWE4ODBhN2JhZjEzNSIsIm5iZiI6MTcyMTQwMTc2OS42MTUzNjIsInN1YiI6IjY2OWE4MDUwODMwYzgwZGUwYjNjMzk3NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cnIyy5qW24flLg429Vjjt_4mjCqM-vnuM7ILNYco-FQ'
  };
  
  static const String imagePath = 'https://image.tmdb.org/t/p/w500';

//end points
  static const String getGenresList = 'genre/movie/list'; //Get
  static const String getTrendingMovies =
      'discover/movie?include_adult=false&sort_by=popularity.desc&page='; //Get
  static const String getMovieDetails = 'movie/'; //Get
}
