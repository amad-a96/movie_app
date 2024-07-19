import 'package:equatable/equatable.dart';

class TemplateEntity extends Equatable {
  final int? id;

  const TemplateEntity({
    this.id,
  });

  TemplateEntity copyWith({
    int? id,
  }) {
    return TemplateEntity(
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [id];
}
