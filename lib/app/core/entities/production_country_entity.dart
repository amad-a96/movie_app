import 'package:equatable/equatable.dart';

class ProductionCountryEntity extends Equatable {
  final String? iso31661;
  final String? name;

  const ProductionCountryEntity({
    this.iso31661,
    this.name,
  });

  @override
  List<Object?> get props => [iso31661, name];
}
