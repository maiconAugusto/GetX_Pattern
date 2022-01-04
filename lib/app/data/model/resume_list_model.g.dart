// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResumeListModel _$ResumeListModelFromJson(Map<String, dynamic> json) =>
    ResumeListModel(
      userId: json['userId'] as String?,
      senderId: json['senderId'] as String?,
      message: json['message'] as String?,
      sender: (json['sender'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      user: (json['user'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ResumeListModelToJson(ResumeListModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'senderId': instance.senderId,
      'message': instance.message,
      'sender': instance.sender,
      'user': instance.user,
    };
