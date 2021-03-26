import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agro_tour.g.dart';

@JsonSerializable()
class AgroTour extends Equatable {
	@JsonKey(name: 'name')
	final String name;

	const AgroTour({this.name});

	factory AgroTour.fromJson(Map<String, dynamic> json) {
		return _$AgroTourFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AgroTourToJson(this);	

AgroTour copyWith({
		String name,
	}) {
		return AgroTour(
			name: name ?? this.name,
		);
	}

	@override
	List<Object> get props => [name];
}
