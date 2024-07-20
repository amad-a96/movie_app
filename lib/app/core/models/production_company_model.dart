import '../entities/production_company_entity.dart';

class ProductionCompanyModel extends ProductionCompanyEntity {
  ProductionCompanyModel({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) : super(
          id: id,
          logoPath: logoPath,
          name: name,
          originCountry: originCountry,
        );

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'] as int?,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }

  factory ProductionCompanyModel.fromEntity(ProductionCompanyEntity entity) {
    return ProductionCompanyModel(
      id: entity.id,
      logoPath: entity.logoPath,
      name: entity.name,
      originCountry: entity.originCountry,
    );
  }

  ProductionCompanyEntity toEntity() {
    return ProductionCompanyEntity(
      id: id,
      logoPath: logoPath,
      name: name,
      originCountry: originCountry,
    );
  }
}
