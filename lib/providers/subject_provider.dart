import 'dart:convert';

import 'package:flutter_yestech/models/base/EventObject.dart';
import 'package:flutter_yestech/models/subject/subject.dart';
import 'package:flutter_yestech/models/user/ApiResponse.dart';
import 'package:flutter_yestech/models/user/User.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'package:http/http.dart' as http;
class SubjectProvider {
  ///////////////////////////////////////////////////////////////////////////////
  Future<EventObject> saveSubject(String token, String userid, String name, String description, String level, String section, String semester, String schoolYear) async {
    try {
      final encoding = APIConstants.OCTET_STREAM_ENCODING;
      final response = await http.post('${APIConstants.API_BASE_LIVE_URL}/controller_educator/add_subjects.php',
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'teach_token': token,
            'teach_id': userid,
            'subj_title': name,
            'subj_description': description,
            'subj_section': section,
            'subj_level': level,
            'subj_semester': semester,
            'subj_school_year': schoolYear,
            'subj_file': '',
          },
          encoding: Encoding.getByName(encoding));
      print(response.body);
      final responseJson = json.decode(response.body.substring(1, response.body .length-1));

      ApiResponse apiResponse = ApiResponse.fromJson(responseJson);
      if (apiResponse.result == 'success') {
        print('YAWA 2 ' );
        return new EventObject(
            id: EventConstants.ADD_SUBJECT_SUCCESSFUL, object: null);
      } else if (response.body == APIOperations.FAILURE) {
        print('YAWA 3 ' );
        return new EventObject(id: EventConstants.SUBJECT_ALREADY_REGISTERED);
      } else {
        print('YAWA 4 ' );
        return new EventObject(
            id: EventConstants.ADD_SUBJECT_UN_SUCCESSFUL);
      }
    } catch (Exception) {
      return EventObject();
    }
  }

  ///////////////////////////////////////////////////////////////////////////////
  Future<EventObject> deleteSubject(String token, String subjectid) async {
    try {
      final encoding = APIConstants.OCTET_STREAM_ENCODING;
      final response = await http.post('${APIConstants.API_BASE_LIVE_URL}/controller_educator/DeleteSubjectById.php',
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'teach_token': token,
            'subj_id': subjectid,
          },
          encoding: Encoding.getByName(encoding));
      print(response.body);

      if (response.body == 'success') {
        print('YAWA 2 ' );
        return new EventObject(
            id: EventConstants.DELETE_SUBJECT_SUCCESSFUL, object: null);
      } else if (response.body == APIOperations.FAILURE) {
        print('YAWA 3 ' );
        return new EventObject(id: EventConstants.DELETE_SUBJECT_UN_SUCCESSFUL);
      } else {
        print('YAWA 4 ' );
        return new EventObject(
            id: EventConstants.DELETE_SUBJECT_UN_SUCCESSFUL);
      }
    } catch (Exception) {
      return EventObject();
    }
  }

  ///////////////////////////////////////////////////////////////////////////////
  Future<EventObject> getEducatorSubjectDetails(String token, String userid) async {
    try {
      final encoding = APIConstants.OCTET_STREAM_ENCODING;
      final response = await http.post('${APIConstants.API_BASE_LIVE_URL}/controller_educator/get_subjects.php',
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'teach_token': token,
            'teach_id': userid,
          },
          encoding: Encoding.getByName(encoding));
      print(response.body);

      if (response.body == 'success') {
        print('YAWA 2 ' );
        return new EventObject(
            id: EventConstants.GET_USER_SUBJECT_SUCCESSFUL, object: null);
      } else if (response.body == APIOperations.FAILURE) {
        print('YAWA 3 ' );
        return new EventObject(id: EventConstants.GET_USER_SUBJECT_UN_SUCCESSFUL);
      } else {
        print('YAWA 4 ' );
        return new EventObject(
            id: EventConstants.GET_USER_SUBJECT_UN_SUCCESSFUL);
      }
    } catch (Exception) {
      return EventObject();
    }
  }

  Future<List<Subject>> getEducatorSubjectDetails1(String token, String userid) async {
    print("SHIT");
    final encoding = APIConstants.OCTET_STREAM_ENCODING;
    final response = await http.post('${APIConstants.API_BASE_LIVE_URL}/controller_educator/get_subjects.php',
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'teach_token': token,
          'teach_id': userid,
        },
        encoding: Encoding.getByName(encoding));
    print("SHIT" + response.body);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((subject) => new Subject.fromJson(subject)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ///////////////////////////////////////////////////////////////////////////////
  Future<EventObject> addStudentToSubject1(String studentCode, String subjectid) async {
    try {
      print('addStudentToSubject');
      print(studentCode);
      print(subjectid);
      final encoding = APIConstants.OCTET_STREAM_ENCODING;
      final response = await http.post('${APIConstants.API_BASE_LIVE_URL}/controller_educator/add_student_to_subject.php',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
          },
          body: {
            "stud_code": studentCode,
            "subj_id": subjectid
          },
          encoding: Encoding.getByName(encoding)
      );
      print(response.body);
      final responseJson = json.decode(response.body.substring(1, response.body .length-1));

      ApiResponse apiResponse = ApiResponse.fromJson(responseJson);
      print("YAWA" + apiResponse.result);
      if (apiResponse.result == APIOperations.SUCCESS) {
        print('BR 2 ' );
        return new EventObject(
            id: EventConstants.ADD_STUDENT_TO_SUBJECT_SUCCESSFUL, object: null);
      } else if (response.body == APIOperations.FAILURE) {
        print('BR 3 ' );
        return new EventObject(id: EventConstants.STUDENT_ALREADY_ADDED_TO_SUBJECT);
      } else {
        print('BR 4 ' );
        return new EventObject(
            id: EventConstants.ADD_STUDENT_TO_SUBJECT_UNSUCCESSFUL);
      }
    } catch (Exception) {
      return EventObject();
    }
  }


  Future<EventObject> addStudentToSubject(String studentCode, String subjectid) async {
    try {
      final encoding = APIConstants.OCTET_STREAM_ENCODING;
      final response = await http.post('${APIConstants.API_BASE_LIVE_URL}/controller_educator/add_student_to_subject.php',
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'stud_code': studentCode,
            'subj_id': subjectid
          },
          encoding: Encoding.getByName(encoding)
      );
      print("YAWA" + response.body);
    } catch (Exception) {
      return EventObject();
    }
  }



  Future<List<Users>> getStudentDetails(String subjectid) async {
    print("FASDG");
    final encoding = APIConstants.OCTET_STREAM_ENCODING;
    final response = await http.post('${APIConstants.API_BASE_LIVE_URL}/controller_educator/get_students_from_subject.php',
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'subj_id': subjectid,
        },
        encoding: Encoding.getByName(encoding));
    print("FASDF" + response.body);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((users) => new Users.fromJson(users)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }



  ///////////////////////////////////////////////////////////////////////////////
  Future<EventObject> getStudentSubjectDetails(String token, String userid) async {
    try {
      final encoding = APIConstants.OCTET_STREAM_ENCODING;
      final response = await http.post('${APIConstants.API_BASE_LIVE_URL}/controller_student/get_student_subjects.php',
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'user_token': token,
            'user_id': userid,
          },
          encoding: Encoding.getByName(encoding));
      print(response.body);

      if (response.body == 'success') {
        print('YAWA 2 ' );
        return new EventObject(
            id: EventConstants.DELETE_SUBJECT_SUCCESSFUL, object: null);
      } else if (response.body == APIOperations.FAILURE) {
        print('YAWA 3 ' );
        return new EventObject(id: EventConstants.DELETE_SUBJECT_UN_SUCCESSFUL);
      } else {
        print('YAWA 4 ' );
        return new EventObject(
            id: EventConstants.DELETE_SUBJECT_UN_SUCCESSFUL);
      }
    } catch (Exception) {
      return EventObject();
    }
  }
}