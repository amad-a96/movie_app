import '../../domain/entities/result_page_entity.dart';
import 'movie_model.dart';

class ResultPageModel extends ResultPageEntity {
  ResultPageModel({
    int? page,
    int? totalPages,
    int? totalResults,
    List<MovieModel>? results,
  }) : super(
          page: page,
          totalPages: totalPages,
          totalResults: totalResults,
          results: results?.map((model) => model.toEntity()).toList(),
        );

  factory ResultPageModel.fromJson(Map<String, dynamic> json) {
    return ResultPageModel(
      page: json['page'] as int?,
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
      results: (json['results'] as List?)
          ?.map((result) => MovieModel.fromJson(result as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'total_pages': totalPages,
      'total_results': totalResults,
      'results': results
          ?.map((movie) => MovieModel.fromEntity(movie).toJson())
          .toList(),
    };
  }

  ResultPageEntity toEntity() {
    return ResultPageEntity(
      page: page,
      totalPages: totalPages,
      totalResults: totalResults,
      results: results?.map((model) => MovieModel.fromEntity(model)).toList(),
    );
  }

  // Convert entity back to model
  factory ResultPageModel.fromEntity(ResultPageEntity entity) {
    return ResultPageModel(
      page: entity.page,
      totalPages: entity.totalPages,
      totalResults: entity.totalResults,
      results: entity.results
          ?.map((entity) => MovieModel.fromEntity(entity))
          .toList(),
    );
  }
}
