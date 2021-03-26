import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
	@JsonKey(name: 'id')
	final int id;
	@JsonKey(name: 'product_name')
	final String productName;
	@JsonKey(name: 'unit')
	final String unit;
	@JsonKey(name: 'image_url')
	final String imageUrl;
	@JsonKey(name: 'name')
	final String name;
	@JsonKey(name: 'raiting')
	final double raiting;
	@JsonKey(name: 'count_raiting')
	final int countRaiting;
	@JsonKey(name: 'brand')
	final String brand;
	@JsonKey(name: 'price')
	final int price;
	@JsonKey(name: 'weight')
	final String weight;
	@JsonKey(name: 'weight_with_packaging')
	final String weightWithPackaging;
	@JsonKey(name: 'category')
	final String category;
	@JsonKey(name: 'type_of_marking')
	final String typeOfMarking;
	@JsonKey(name: 'expiration_date')
	final String expirationDate;
	@JsonKey(name: 'favorite')
	final bool favorite;
	@JsonKey(name: 'discreption')
	final String discreption;

	const Product({
		this.id,
		this.productName,
		this.unit,
		this.imageUrl,
		this.name,
		this.raiting,
		this.countRaiting,
		this.brand,
		this.price,
		this.weight,
		this.weightWithPackaging,
		this.category,
		this.typeOfMarking,
		this.expirationDate,
		this.favorite,
		this.discreption,
	});

	factory Product.fromJson(Map<String, dynamic> json) {
		return _$ProductFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ProductToJson(this);	

Product copyWith({
		int id,
		String productName,
		String unit,
		String imageUrl,
		String name,
		double raiting,
		int countRaiting,
		String brand,
		int price,
		String weight,
		String weightWithPackaging,
		String category,
		String typeOfMarking,
		String expirationDate,
		bool favorite,
		String discreption,
	}) {
		return Product(
			id: id ?? this.id,
			productName: productName ?? this.productName,
			unit: unit ?? this.unit,
			imageUrl: imageUrl ?? this.imageUrl,
			name: name ?? this.name,
			raiting: raiting ?? this.raiting,
			countRaiting: countRaiting ?? this.countRaiting,
			brand: brand ?? this.brand,
			price: price ?? this.price,
			weight: weight ?? this.weight,
			weightWithPackaging: weightWithPackaging ?? this.weightWithPackaging,
			category: category ?? this.category,
			typeOfMarking: typeOfMarking ?? this.typeOfMarking,
			expirationDate: expirationDate ?? this.expirationDate,
			favorite: favorite ?? this.favorite,
			discreption: discreption ?? this.discreption,
		);
	}

	@override
	List<Object> get props {
		return [
			id,
			productName,
			unit,
			imageUrl,
			name,
			raiting,
			countRaiting,
			brand,
			price,
			weight,
			weightWithPackaging,
			category,
			typeOfMarking,
			expirationDate,
			favorite,
			discreption,
		];
	}
}
