import '../../../../core/models/production_company_model.dart';
import '../../../../core/models/production_country_model.dart';
import '../../../../core/models/spoken_language_model.dart';
import '../../../genres/data/models/genre_model.dart';
import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    bool? adult,
    String? backdropPath,
    int? budget,
    List<GenreModel>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompanyModel>? productionCompanies,
    List<ProductionCountryModel>? productionCountries,
    String? releaseDate,
    int? revenue,
    int? runtime,
    List<SpokenLanguageModel>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          budget: budget,
          genres: genres,
          homepage: homepage,
          id: id,
          imdbId: imdbId,
          originCountry: originCountry,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          productionCompanies: productionCompanies,
          productionCountries: productionCountries,
          releaseDate: releaseDate,
          revenue: revenue,
          runtime: runtime,
          spokenLanguages: spokenLanguages,
          status: status,
          tagline: tagline,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      budget: json['budget'] as int?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      id: json['id'] as int?,
      imdbId: json['imdb_id'] as String?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: json['popularity'] as double?,
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map(
              (e) => ProductionCompanyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map(
              (e) => ProductionCountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['release_date'] as String?,
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int?,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: json['vote_average'] as double?,
      voteCount: json['vote_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'budget': budget,
      'genres': genres?.map((e) => GenreModel.fromEntity(e).toJson()).toList(),
      'homepage': homepage,
      'id': id,
      'imdb_id': imdbId,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies': productionCompanies
          ?.map((e) => ProductionCompanyModel.fromEntity(e).toJson())
          .toList(),
      'production_countries': productionCountries
          ?.map((e) => ProductionCountryModel.fromEntity(e).toJson())
          .toList(),
      'release_date': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spokenLanguages
          ?.map((e) => SpokenLanguageModel.fromEntity(e).toJson())
          .toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory MovieDetailsModel.fromEntity(MovieDetailsEntity entity) {
    return MovieDetailsModel(
      adult: entity.adult,
      backdropPath: entity.backdropPath,
      budget: entity.budget,
      genres: entity.genres?.map((e) => GenreModel.fromEntity(e)).toList(),
      homepage: entity.homepage,
      id: entity.id,
      imdbId: entity.imdbId,
      originCountry: entity.originCountry,
      originalLanguage: entity.originalLanguage,
      originalTitle: entity.originalTitle,
      overview: entity.overview,
      popularity: entity.popularity,
      posterPath: entity.posterPath,
      productionCompanies: entity.productionCompanies
          ?.map((e) => ProductionCompanyModel.fromEntity(e))
          .toList(),
      productionCountries: entity.productionCountries
          ?.map((e) => ProductionCountryModel.fromEntity(e))
          .toList(),
      releaseDate: entity.releaseDate,
      revenue: entity.revenue,
      runtime: entity.runtime,
      spokenLanguages: entity.spokenLanguages
          ?.map((e) => SpokenLanguageModel.fromEntity(e))
          .toList(),
      status: entity.status,
      tagline: entity.tagline,
      title: entity.title,
      video: entity.video,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
    );
  }

  MovieDetailsEntity toEntity() {
    return MovieDetailsEntity(
      adult: adult,
      backdropPath: backdropPath,
      budget: budget,
      genres: genres?.map((e) => e).toList(),
      homepage: homepage,
      id: id,
      imdbId: imdbId,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      productionCompanies: productionCompanies?.map((e) => e).toList(),
      productionCountries: productionCountries?.map((e) => e).toList(),
      releaseDate: releaseDate,
      revenue: revenue,
      runtime: runtime,
      spokenLanguages: spokenLanguages?.map((e) => e).toList(),
      status: status,
      tagline: tagline,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
