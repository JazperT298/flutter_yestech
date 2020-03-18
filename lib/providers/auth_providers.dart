
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_yestech/models/base/EventObject.dart';
import 'package:flutter_yestech/models/user/ApiRequest.dart';
import 'package:flutter_yestech/models/user/ApiResponse.dart';
import 'package:flutter_yestech/models/user/User.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'package:http/http.dart' as http;

///////////////////////////////////////////////////////////////////////////////
Future<EventObject> loginUser(String email, String password) async {
  try {
    final encoding = APIConstants.OCTET_STREAM_ENCODING;
    final response = await http.post('${APIConstants.API_BASE_LIVE_URL}/controller_educator/login_as_educator_class.php',
        headers: {
          'Accept': 'application/json',
        }, body: {
          'login_e_email_address': email,
          'login_e_password': password,
        },
        encoding: Encoding.getByName(encoding));
    print('FUCK s ' + response.body.substring(1, response.body .length-1));
    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK &&
          response.body != null) {
        print('YAWA 1 ' );
        final responseJson = json.decode(response.body.substring(1, response.body .length-1));
        String token = responseJson['user_token'];
        String userid = responseJson['user_id'];
        String code = responseJson['user_code'];

        print(userid);
        print(token);
        print(responseJson);
        print(responseJson['user_token']);
        ApiResponse apiResponse = ApiResponse.fromJson(responseJson);
        print(responseJson);
        if (apiResponse.result == 'success_educator') {
          print('YAWA 2 ' );

          //Temporary solution
          ApiRequest apiRequest = new ApiRequest();
          Users users = new Users(user_id: userid, user_token: token, user_code: code, user_email_address: email, user_password: password);
          apiRequest.users = users;
          print(json.encode(apiRequest.toJson()));
          return new EventObject(
              id: EventConstants.LOGIN_USER_SUCCESSFUL,
              object: users);
        } else {
          print('YAWA 3 ' );
          return new EventObject(id: EventConstants.LOGIN_USER_UN_SUCCESSFUL);
        }
      } else {
        print('YAWA 4 ' );
        return new EventObject(id: EventConstants.LOGIN_USER_UN_SUCCESSFUL);
      }
    } else {
      print('YAWA 5 ' );
      return new EventObject();
    }
  } catch (Exception) {
    print('YAWA 6 ' );
    print(Exception);
    return EventObject();
  }
}

///////////////////////////////////////////////////////////////////////////////
Future<EventObject> registerUser(String email, String password) async {
  try {
    final encoding = APIConstants.OCTET_STREAM_ENCODING;
    final response = await http.post('${APIConstants.API_BASE_LIVE_URL}/controller_educator/register_as_educator_class.php',
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'e_email_address': email,
          'e_password': password,
        },
        encoding: Encoding.getByName(encoding));
    print(response.body);

    if (response.body == 'success') {
      print('YAWA 2 ' );
      return new EventObject(
          id: EventConstants.USER_REGISTRATION_SUCCESSFUL, object: null);
    } else if (response.body == APIOperations.FAILURE) {
      print('YAWA 3 ' );
      return new EventObject(id: EventConstants.USER_ALREADY_REGISTERED);
    } else {
      print('YAWA 4 ' );
      return new EventObject(
          id: EventConstants.USER_REGISTRATION_UN_SUCCESSFUL);
    }
  } catch (Exception) {
    return EventObject();
  }
}

///////////////////////////////////////////////////////////////////////////////
//Future<EventObject> changePassword(
//    String emailId, String oldPassword, String newPassword) async {
//  ApiRequest apiRequest = new ApiRequest();
//  Users user = new Users(
//      email: emailId, old_password: oldPassword, new_password: newPassword);
//
//  apiRequest.operation = APIOperations.CHANGE_PASSWORD;
//  apiRequest.user = user;
//
//  try {
//    final encoding = APIConstants.OCTET_STREAM_ENCODING;
//    final response = await http.post(APIConstants.API_BASE_URL,
//        body: json.encode(apiRequest.toJson()),
//        encoding: Encoding.getByName(encoding));
//    if (response != null) {
//      if (response.statusCode == APIResponseCode.SC_OK &&
//          response.body != null) {
//        final responseJson = json.decode(response.body);
//        ApiResponse apiResponse = ApiResponse.fromJson(responseJson);
//        if (apiResponse.result == APIOperations.SUCCESS) {
//          return new EventObject(
//              id: EventConstants.CHANGE_PASSWORD_SUCCESSFUL, object: null);
//        } else if (apiResponse.result == APIOperations.FAILURE) {
//          return new EventObject(id: EventConstants.INVALID_OLD_PASSWORD);
//        } else {
//          return new EventObject(
//              id: EventConstants.CHANGE_PASSWORD_UN_SUCCESSFUL);
//        }
//      } else {
//        return new EventObject(
//            id: EventConstants.CHANGE_PASSWORD_UN_SUCCESSFUL);
//      }
//    } else {
//      return new EventObject();
//    }
//  } catch (Exception) {
//    return EventObject();
//  }
//}
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
Future<EventObject> getUserDetails(String token, String userid) async {
  print('FUCK M ');
  print(userid);
  print(token);
  try {
    final encoding = APIConstants.OCTET_STREAM_ENCODING;
    print('1s ' );
    final response = await http.post('${APIConstants.API_BASE_LIVE_URL}/controller_global/get_user_details.php',
        body: json.encode({
          'user_token': token,
          'user_id': userid,
        }),
        encoding: Encoding.getByName(encoding));
    print('2s ' );
    print('body: ${response.body}');
//    print(response.body.substring(1, response.body .length-1));
    final responseBody = json.decode(response.body);

//    Users users = Users(
//
//    );


  } catch (Exception) {
    print(Exception);
//    return EventObject();
  }
}

void getUsersDetail(String token, String userid) async {
  final encoding = APIConstants.OCTET_STREAM_ENCODING;
  print('11s ' );
  final response = await http.post('${APIConstants.API_BASE_LIVE_URL}/controller_global/get_user_details.php',
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'user_token': token,
        'user_id': userid,
      },
      encoding: Encoding.getByName(encoding));
  print('22s ' );
  final responseBody = json.decode(response.body);
  print(responseBody);
//    Users users = Users(
//
//    );
//  var jsonData = '{ "name" : "Dane", "alias" : "FilledStacks"  }';
//  var parsedJson = json.decode(jsonData);
//  var user = User(parsedJson);
//  print('${user.name} is ${user.alias}');
//  var jsonData = '{ "name" : "Dane", "alias" : "FilledStacks"  }';
//  var parsedJson = json.decode(jsonData);
//  var user = User.fromJson(parsedJson);
//  print('${user.name} is ${user.alias}');

}

