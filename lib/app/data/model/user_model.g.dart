// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      cpf: json['cpf'] as String?,
      cep: json['cep'] as String?,
      occupation: json['occupation'] as String?,
      description: json['description'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      houseNumber: json['houseNumber'] as String?,
      active: json['active'] as bool?,
      birthDate: json['birthDate'] as String?,
      photo: json['photo'] as String?,
      street: json['street'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'cpf': instance.cpf,
      'cep': instance.cep,
      'occupation': instance.occupation,
      'description': instance.description,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'houseNumber': instance.houseNumber,
      'active': instance.active,
      'birthDate': instance.birthDate,
      'photo': instance.photo,
      'street': instance.street,
      'password': instance.password,
    };
