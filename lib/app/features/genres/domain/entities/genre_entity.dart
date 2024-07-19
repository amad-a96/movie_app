import 'package:equatable/equatable.dart';

class GenreEntity extends Equatable {
  final int? id;
  final String? name;

  const GenreEntity({
    this.id,
    this.name,
  });

  GenreEntity copyWith({
    int? id,
    String? name,
  }) {
    return GenreEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
