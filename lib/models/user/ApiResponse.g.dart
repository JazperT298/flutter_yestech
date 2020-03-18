// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiResponse.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => new ApiResponse(
    result: json['result'] as String,
    message: json['message'] as String,
    users: json['users'] == null
        ? null
        : new Users.fromJson(json['users'] as Map<String, dynamic>));

abstract class _$ApiResponseSerializerMixin {
  String get result;

  String get message;

  Users get users;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'result': result, 'message': message, 'users': users};
}
