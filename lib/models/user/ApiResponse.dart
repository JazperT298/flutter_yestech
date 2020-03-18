
import 'package:flutter_yestech/models/user/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ApiResponse.g.dart';

@JsonSerializable()
class ApiResponse extends Object with _$ApiResponseSerializerMixin {
  String result;
  String message;
  Users users;

  ApiResponse({this.result, this.message, this.users});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
