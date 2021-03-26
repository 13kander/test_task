// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int,
    productName: json['product_name'] as String,
    unit: json['unit'] as String,
    imageUrl: json['image_url'] as String,
    name: json['name'] as String,
    raiting: (json['raiting'] as num)?.toDouble(),
    countRaiting: json['count_raiting'] as int,
    brand: json['brand'] as String,
    price: json['price'] as int,
    weight: json['weight'] as String,
    weightWithPackaging: json['weight_with_packaging'] as String,
    category: json['category'] as String,
    typeOfMarking: json['type_of_marking'] as String,
    expirationDate: json['expiration_date'] as String,
    favorite: json['favorite'] as bool,
    discreption: json['discreption'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'unit': instance.unit,
      'image_url': instance.imageUrl,
      'name': instance.name,
      'raiting': instance.raiting,
      'count_raiting': instance.countRaiting,
      'brand': instance.brand,
      'price': instance.price,
      'weight': instance.weight,
      'weight_with_packaging': instance.weightWithPackaging,
      'category': instance.category,
      'type_of_marking': instance.typeOfMarking,
      'expiration_date': instance.expirationDate,
      'favorite': instance.favorite,
      'discreption': instance.discreption,
    };
