import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fermer.g.dart';

@JsonSerializable()
class Fermer extends Equatable {
	@JsonKey(name: 'name')
	final String name;

	const Fermer({this.name});

	factory Fermer.fromJson(Map<String, dynamic> json) => _$FermerFromJson(json);

	Map<String, dynamic> toJson() => _$FermerToJson(this);	

Fermer copyWith({
		String name,
	}) {
		return Fermer(
			name: name ?? this.name,
		);
	}

	@override
	List<Object> get props => [name];
}
