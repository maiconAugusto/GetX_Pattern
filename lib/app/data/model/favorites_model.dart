import 'package:json_annotation/json_annotation.dart';

part 'favorites_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  String? id;
  String? favoriteId;
  String? photo;
  String? name;
  String? occupation;

  FavoriteModel({
    this.id,
    this.favoriteId,
    this.photo,
    this.name,
    this.occupation,
  });
  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return _$FavoriteModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);
}
