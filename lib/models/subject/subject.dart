import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Subject extends Object with _$SubjectSerializerMixin{
  final String subj_id;
  final String subj_level;
  final String user_id;
  final String user_token;
  final String subj_section;
  final String subj_title;
  final String subj_description;
  final String subj_semester;
  final String subj_school_year;
  final String subj_file;
  final String subj_code;
  final String subj_is_deleted;
  final String studentCount;

  Subject({
    this.subj_id,
    this.subj_level,
    this.user_id,
    this.user_token,
    this.subj_section,
    this.subj_title,
    this.subj_description,
    this.subj_semester,
    this.subj_school_year,
    this.subj_file,
    this.subj_code,
    this.subj_is_deleted,
    this.studentCount
  });
  factory Subject.fromJson(Map<String, dynamic> json) {
    return new Subject(
        subj_id: json['subj_id'] as String,
        subj_level: json['subj_level'] as String,
        user_id: json['user_id'] as String,
        user_token: json['user_token'] as String,
        subj_section: json['subj_section'] as String,
        subj_title: json['subj_title'] as String,
        subj_description: json['subj_description'] as String,
        subj_semester: json['subj_semester'] as String,
        subj_school_year: json['subj_school_year'] as String,
        subj_file: json['subj_file'] as String ,
        subj_code: json['subj_code'] as String,
        subj_is_deleted: json['subj_is_deleted'] as String,
        studentCount: json['studentCount'] as String
    );
  }
}

abstract class _$SubjectSerializerMixin {
  String get subj_id;
  String get subj_level;
  String get user_id;
  String get user_token;
  String get subj_section;
  String get subj_title;
  String get subj_description;
  String get subj_semester;
  String get subj_school_year;
  String get subj_file;
  String get subj_code;
  String get subj_is_deleted;
  String get studentCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'subj_id': subj_id,
    'subj_level': subj_level,
    'user_id': user_id,
    'user_token': user_token,
    'subj_section': subj_section,
    'subj_title': subj_title,
    'subj_description': subj_description,
    'subj_semester': subj_semester,
    'subj_school_year': subj_school_year,
    'subj_file': subj_file,
    'subj_code': subj_code,
    'subj_is_deleted': subj_is_deleted,
    'studentCount': studentCount
  };
}