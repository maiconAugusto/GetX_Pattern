import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  String? id;
  String? message;
  String? userId;
  String? userName;
  String? userPhoto;
  String? senderId;
  String? senderName;
  String? senderPhoto;
  String? createdAt;
  String? updatedAt;
  MessageModel({
    this.id,
    this.message,
    this.userName,
    this.userPhoto,
    this.senderId,
    this.senderName,
    this.senderPhoto,
    this.createdAt,
    this.updatedAt,
  });
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return _$MessageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
