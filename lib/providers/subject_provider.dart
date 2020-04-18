import 'dart:convert';

import 'package:flutter_yestech/models/base/EventObject.dart';
import 'package:flutter_yestech/models/subject/subject.dart';
import 'package:flutter_yestech/models/user/ApiResponse.dart';
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
            'subj_level': level,
            'subj_section': section,
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
            'user_token': token,
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
//        var jsonData = json.decode(response.body);
//        print("SHIT" + response.body);
//        List <Subject> subjects = [];
//
//        for (var s in jsonData){
//          Subject subject = Subject();
//        }
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