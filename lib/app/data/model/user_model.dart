import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? cep;
  String? occupation;
  String? description;
  String? city;
  String? state;
  String? country;
  String? houseNumber;
  bool? active;
  String? birthDate;
  String? photo;
  String? street;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.cep,
    this.occupation,
    this.description,
    this.city,
    this.state,
    this.country,
    this.houseNumber,
    this.active,
    this.birthDate,
    this.photo,
    this.street,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
