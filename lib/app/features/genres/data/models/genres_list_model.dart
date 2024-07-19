import '../../domain/entities/genre_entity.dart';
import '../../domain/entities/genres_list_entity.dart';
import 'genre_model.dart';

class GenresListModel extends GenresListEntity {
  const GenresListModel({
    final List<GenreEntity>? genres,
  }) : super(
          genres: genres,
        );

  factory GenresListModel.fromJson(Map<String, dynamic> json) {
    return GenresListModel(
      genres: json['genres'] != null
          ? (json['genres'] as List<dynamic>)
              .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'genres': genres?.map((e) => (e as GenreModel).toJson()).toList(),
    };
  }
}
