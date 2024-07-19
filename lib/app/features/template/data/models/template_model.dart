import '../../domain/entities/template_entity.dart';

class TemplateModel extends TemplateEntity {
  const TemplateModel({
    final int? id,
  }) : super(
          id: id,
        );

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
