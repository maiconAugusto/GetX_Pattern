import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  Map<String, dynamic> user;
  AuthModel({
    required this.user,
  });
}
