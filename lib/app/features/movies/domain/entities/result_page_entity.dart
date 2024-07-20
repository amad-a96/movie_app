import 'package:equatable/equatable.dart';
import 'movie_entity.dart';

class ResultPageEntity extends Equatable {
  final int? page;
  final int? totalPages;
  final int? totalResults;
  final List<MovieEntity>? results;

  const ResultPageEntity({
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
  });

  @override
  List<Object?> get props => [page, totalPages, totalResults, results];
}
