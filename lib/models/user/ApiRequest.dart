
import 'package:flutter_yestech/models/user/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ApiRequest.g.dart';

@JsonSerializable()
class ApiRequest extends Object with _$ApiRequestSerializerMixin {
  String operation;
  Users users;

  ApiRequest({this.operation, this.users});

  factory ApiRequest.fromJson(Map<String, dynamic> json) =>
      _$ApiRequestFromJson(json);

}
