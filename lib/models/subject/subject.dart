import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Subject extends Object with _$SubjectSerializerMixin{
  final String id;
  final String level;
  final String user_id;
  final String section;
  final String title;
  final String description;
  final String semester;
  final String school_year;
  final String image;
  final String code;
  final String user_firstname;
  final String user_lastname;
  final String stud_count;

  Subject({
    this.id, this.level, this.user_id, this.section, this.title, this.description, this.semester, this.school_year, this.image, this.code, this.user_firstname, this.user_lastname, this.stud_count
  });
  factory Subject.fromJson(Map<String, dynamic> json) {
    return new Subject(
        level: json['level'] ,
        user_id: json['user_id'] ,
        section: json['section'],
        title: json['title'],
        description: json['description'],
        semester: json['semester'] ,
        school_year: json['school_year'] ,
        image: json['image']  ,
        code: json['code'],
        user_firstname: json['user_firstname'] ,
        user_lastname: json['user_lastname'],
        stud_count: json['stud_count']
    );
  }
}

abstract class _$SubjectSerializerMixin {
  String get level;
  String get user_id;
  String get section;
  String get title;
  String get description;
  String get semester;
  String get school_year;
  String get image;
  String get code;
  String get user_firstname;
  String get user_lastname;
  String get stud_count;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'level': level,
    'user_id': user_id,
    'section': section,
    'title': title,
    'description': description,
    'semester': semester,
    'school_year': school_year,
    'image': image,
    'code': code,
    'user_firstname': user_firstname,
    'user_lastname': user_lastname,
    'stud_count': stud_count
  };
}