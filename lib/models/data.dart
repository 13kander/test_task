import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'agro_tour.dart';
import 'fermer.dart';
import 'product.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  @JsonKey(name: 'product')
  final List<Product> product;
  @JsonKey(name: 'fermer')
  final List<Fermer> fermer;
  @JsonKey(name: 'agro_tour')
  final List<AgroTour> agroTour;

  const Data({
    this.product,
    this.fermer,
    this.agroTour,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    List<Product> product,
    List<Fermer> fermer,
    List<AgroTour> agroTour,
  }) {
    return Data(
      product: product ?? this.product,
      fermer: fermer ?? this.fermer,
      agroTour: agroTour ?? this.agroTour,
    );
  }

  @override
  List<Object> get props => [product, fermer, agroTour];
}
