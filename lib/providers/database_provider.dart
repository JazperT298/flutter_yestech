
import 'dart:convert';

import 'package:flutter_yestech/models/base/EventObject.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'package:http/http.dart' as http;

class DatabaseProvider {
  ///////////////////////////////////////////////////////////////////////////////
  Future<EventObject> saveSubject(String token, String userid, String name, String description, String level, String section, String semester, String schoolYear, String file) async {
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

      if (response.body == 'success') {
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

}