// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'] as String?,
      message: json['message'] as String?,
      userName: json['userName'] as String?,
      userPhoto: json['userPhoto'] as String?,
      senderId: json['senderId'] as String?,
      senderName: json['senderName'] as String?,
      senderPhoto: json['senderPhoto'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    )..userId = json['userId'] as String?;

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'userId': instance.userId,
      'userName': instance.userName,
      'userPhoto': instance.userPhoto,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderPhoto': instance.senderPhoto,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
