// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    product: (json['product'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    fermer: (json['fermer'] as List)
        ?.map((e) =>
            e == null ? null : Fermer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    agroTour: (json['agro_tour'] as List)
        ?.map((e) =>
            e == null ? null : AgroTour.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'product': instance.product,
      'fermer': instance.fermer,
      'agro_tour': instance.agroTour,
    };
