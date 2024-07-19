import 'package:equatable/equatable.dart';
import 'genre_entity.dart';

class GenresListEntity extends Equatable {
  final List<GenreEntity>? genres;

  const GenresListEntity({
    required this.genres,
  });

  GenresListEntity copyWith({
    List<GenreEntity>? genres,
  }) {
    return GenresListEntity(
      genres: genres ?? this.genres,
    );
  }

  @override
  List<Object?> get props => [genres];
}