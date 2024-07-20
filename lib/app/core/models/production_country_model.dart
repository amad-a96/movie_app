import '../entities/production_country_entity.dart';

class ProductionCountryModel extends ProductionCountryEntity {
  ProductionCountryModel({
    String? iso31661,
    String? name,
  }) : super(iso31661: iso31661, name: name);

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) {
    return ProductionCountryModel(
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iso_3166_1': iso31661,
      'name': name,
    };
  }

  factory ProductionCountryModel.fromEntity(ProductionCountryEntity entity) {
    return ProductionCountryModel(
      iso31661: entity.iso31661,
      name: entity.name,
    );
  }

  ProductionCountryEntity toEntity() {
    return ProductionCountryEntity(
      iso31661: iso31661,
      name: name,
    );
  }
}
