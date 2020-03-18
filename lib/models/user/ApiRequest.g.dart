// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiRequest.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ApiRequest _$ApiRequestFromJson(Map<String, dynamic> json) => new ApiRequest(
    operation: json['operation'] as String,
    users: json['users'] == null
        ? null
        : new Users.fromJson(json['users'] as Map<String, dynamic>));

abstract class _$ApiRequestSerializerMixin {
  String get operation;

  Users get users;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'operation': operation, 'users': users};
}
