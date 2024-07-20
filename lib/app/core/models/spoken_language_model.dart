import '../entities/spoken_language_entity.dart';

class SpokenLanguageModel extends SpokenLanguageEntity {
  SpokenLanguageModel({
    String? englishName,
    String? iso6391,
    String? name,
  }) : super(englishName: englishName, iso6391: iso6391, name: name);

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) {
    return SpokenLanguageModel(
      englishName: json['english_name'] as String?,
      iso6391: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'english_name': englishName,
      'iso_639_1': iso6391,
      'name': name,
    };
  }

  factory SpokenLanguageModel.fromEntity(SpokenLanguageEntity entity) {
    return SpokenLanguageModel(
      englishName: entity.englishName,
      iso6391: entity.iso6391,
      name: entity.name,
    );
  }

  SpokenLanguageEntity toEntity() {
    return SpokenLanguageEntity(
      englishName: englishName,
      iso6391: iso6391,
      name: name,
    );
  }
}
