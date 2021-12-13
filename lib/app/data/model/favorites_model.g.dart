// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) =>
    FavoriteModel(
      id: json['id'] as String?,
      favoriteId: json['favoriteId'] as String?,
      photo: json['photo'] as String?,
      name: json['name'] as String?,
      occupation: json['occupation'] as String?,
    );

Map<String, dynamic> _$FavoriteModelToJson(FavoriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'favoriteId': instance.favoriteId,
      'photo': instance.photo,
      'name': instance.name,
      'occupation': instance.occupation,
    };
