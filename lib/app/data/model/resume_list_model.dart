import 'package:json_annotation/json_annotation.dart';

part 'resume_list_model.g.dart';

@JsonSerializable()
class ResumeListModel {
  String? userId;
  String? senderId;
  String? message;
  List<Map<String, dynamic>>? sender;
  List<Map<String, dynamic>>? user;

  ResumeListModel({
    this.userId,
    this.senderId,
    this.message,
    this.sender,
    this.user,
  });
  factory ResumeListModel.fromJson(Map<String, dynamic> json) {
    return _$ResumeListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResumeListModelToJson(this);
}
