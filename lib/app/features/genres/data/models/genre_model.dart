import '../../domain/entities/genre_entity.dart';

class GenreModel extends GenreEntity {
  const GenreModel({
    final int? id,
    final String? name,
  }) : super(
          id: id,
          name: name,
        );

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory GenreModel.fromEntity(GenreEntity entity) {
    return GenreModel(
      id: entity.id,
      name: entity.name,
    );
  }

  GenreEntity toEntity() {
    return GenreEntity(
      id: id,
      name: name,
    );
  }
}
