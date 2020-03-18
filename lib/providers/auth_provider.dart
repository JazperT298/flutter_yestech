import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/customviews/progress_dialog.dart';
import 'package:flutter_yestech/models/user/user_educator.dart';
import 'package:flutter_yestech/models/user/users.dart';
import 'package:flutter_yestech/screens/dashboard_screen.dart';
import 'package:flutter_yestech/screens/home_screen.dart';
import 'package:flutter_yestech/services/auth_service.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_yestech/utils/notification_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  String currentUserId;
  Status _status = Status.Uninitialized;
  String _token;
  NotificationText _notification;

  Status get status => _status;
  String get token => _token;
  NotificationText get notification => _notification;

  final String api = 'http://192.168.1.6/yes_tech/controllerClass';

  ProgressDialog progressDialog =
  ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_LOG_IN);

  initAuthProvider() async {
    String token = await getToken();
    if (token != null) {
      _token = token;
      _status = Status.Authenticated;
    } else {
      _status = Status.Unauthenticated;
    }
    notifyListeners();
  }

  Future<bool> loginEducator(BuildContext context, String email, String password) async {
    //progressDialog.showProgress();
    _status = Status.Authenticating;
    _notification = null;
    notifyListeners();
    final url = "$api/controller_educator/login_as_educator_class.php";

    Map<String, String> body = {
      'user_email_address': email,
      'user_password': password,
    };
    final response = await http.post(url, body: body,);
    print(response.body.substring(1, response.body .length-1));
    print('asdasdasdasdasd  $response.statusCode');
    if (response.statusCode == 200) {
      print('educator login');
      Map<String, dynamic>  apiResponse = json.decode(response.body.substring(1, response.body .length-1));
      _status = Status.Authenticated;
      _token = apiResponse['user_token'];

      Users users = Users();
      users.id = apiResponse['user_id'];
      users.token = apiResponse['user_token'];
      users.profileImageUrl = apiResponse['user_image'];


      print(users.id);
      print(users.token);
      await storeUsersData(apiResponse);
      notifyListeners();
      //progressDialog.hideProgress();
      //AuthService.loginUsers(context, email, password);
      //Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(builder: (context) => new DashboardScreen()),
      );
      return true;
    }else if (response.statusCode == 401) {
      Fluttertoast.showToast(
          msg: "Invalid email or password.",
          backgroundColor: Colors.yellow,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1
      );
      return false;
    }
    _status = Status.Unauthenticated;
    //progressDialog.hideProgress();
    Fluttertoast.showToast(
        msg: "Server error.",
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1
    );
    notifyListeners();
    return false;
  }

  Future<bool> loginStudent(BuildContext context, String email, String password) async {
    _status = Status.Authenticating;
    _notification = null;
    notifyListeners();
    final url = "$api/controller_student/login_as_student_class.php";
    Map<String, String> body = {
      'user_email_address': email,
      'user_password': password,
    };
    final response = await http.post(url, body: body,);
    print(response.body.substring(1, response.body .length-1));
    if (response.statusCode == 200) {
      print('student login');
      Map<String, dynamic>  apiResponse = json.decode(response.body.substring(1, response.body .length-1));
      _status = Status.Authenticated;
      _token = apiResponse['user_token'];

      Users users = Users();
      users.id = apiResponse['user_id'];
      users.token = apiResponse['user_token'];
      users.profileImageUrl =apiResponse['user_image'];

      await storeUsersData(apiResponse);
      notifyListeners();
     // AuthService.loginUsers(context, email, password);
      Navigator.pop(context);
      return true;
    }else if (response.statusCode == 401) {
      _status = Status.Unauthenticated;
      Fluttertoast.showToast(
          msg: "Invalid email or password.",
          backgroundColor: Colors.yellow,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1
      );
      notifyListeners();
      return false;
    }
    _status = Status.Unauthenticated;
    Fluttertoast.showToast(
        msg: "Server error.",
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1
    );
    notifyListeners();
    return false;
  }

  Future<Map> registerEducator(String email, String password) async {
//    progressDialog.showProgress();
    final url = "$api/controller_educator/register_as_educator_class.php";
    Map<String, String> body = {
      'user_email_address': email,
      'user_password': password,
    };
    Map<String, dynamic> result = {
      "success": false,
      "message": 'Unknown error.'
    };
    final response = await http.post( url, body: body, );
    if (response.statusCode == 200) {
//      progressDialog.hideProgress();
      Fluttertoast.showToast(
          msg: "Registration successful, please log in.",
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1
      );
      notifyListeners();
      result['success'] = true;
      return result;
    }
    Map apiResponse = json.decode(response.body);
    if (response.statusCode == 422) {
      if (apiResponse['errors'].containsKey('user_email_address')) {
//        progressDialog.hideProgress();
        result['message'] = apiResponse['errors']['user_email_address'][0];
        return result;
      }
      if (apiResponse['errors'].containsKey('user_password')) {
//        progressDialog.hideProgress();
        result['message'] = apiResponse['errors']['user_password'][0];
        return result;
      }
      return result;
    }
    return result;
  }

  Future<Map> registerStudent(String email, String password) async {
    final url = "$api/controller_student/register_as_student_class.php";
    Map<String, String> body = {
      'user_email_address': email,
      'user_password': password,
    };
    Map<String, dynamic> result = {
      "success": false,
      "message": 'Unknown error.'
    };
    final response = await http.post( url, body: body, );
    print(response.body);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Registration successful, please log in.",
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1
      );
      notifyListeners();
      result['success'] = true;
      return result;
    }
    Map apiResponse = json.decode(response.body);
    if (response.statusCode == 422) {
      if (apiResponse['errors'].containsKey('user_email_address')) {
        result['message'] = apiResponse['errors']['user_email_address'][0];
        return result;
      }
      if (apiResponse['errors'].containsKey('user_password')) {
        result['message'] = apiResponse['errors']['user_password'][0];
        return result;
      }
      return result;
    }
    return result;
  }

  Future<bool> passwordReset(String email) async {
    final url = "$api/forgot-password";
    Map<String, String> body = {
      'email': email,
    };
    final response = await http.post( url, body: body, );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Reset sent. Please check your inbox.",
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1
      );
      notifyListeners();
      return true;
    }
    return false;
  }


  storeUsersData(apiResponse) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString('user_id', apiResponse['user_id']);
    await storage.setString('user_token', apiResponse['user_token']);
    await storage.setString('user_code', apiResponse['user_code']);
    await storage.setString('user_email_address', apiResponse['user_email_address']);
    await storage.setString('user_contact_number', apiResponse['user_contact_number']);
    await storage.setString('user_password', apiResponse['user_password']);
    await storage.setString('user_firstname', apiResponse['user_firstname']);
    await storage.setString('user_lastname', apiResponse['user_lastname']);
    await storage.setString('user_middlename', apiResponse['user_middlename']);
    await storage.setString('user_suffixes', apiResponse['user_suffixes']);
    await storage.setString('user_gender', apiResponse['user_gender']);
    await storage.setString('user_image', apiResponse['user_image']);
    await storage.setString('user_educational_attainment', apiResponse['user_educational_attainment']);
    await storage.setString('user_subj_major', apiResponse['user_subj_major']);
    await storage.setString('user_current_school', apiResponse['user_current_school']);
    await storage.setString('user_position', apiResponse['user_position']);
    await storage.setString('user_activation', apiResponse['user_activation']);
    await storage.setString('validated', apiResponse['validated']);
    await storage.setString('user_role', apiResponse['user_role']);
    await storage.setString('user_facebook', apiResponse['user_facebook']);
    await storage.setString('user_twitter', apiResponse['user_twitter']);
    await storage.setString('user_instagram', apiResponse['user_instagram']);
    await storage.setString('user_gmail', apiResponse['user_gmail']);
    await storage.setString('user_motto', apiResponse['user_motto']);
    await storage.setString('user_nickname', apiResponse['user_nickname']);
    await storage.setString('user_dreamjob', apiResponse['user_dreamjob']);
  }


  Future<String> getToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    String token = storage.getString('user_token');
    return token;
  }

  static Future<String> getUserId() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    String user_id = storage.getString('user_id');
    return user_id;
  }

  static Future<Users> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Users.fromJson(
        json.decode(prefs.getString(SharedPreferenceKeys.USER)));
  }
  static Future<void> setUserProfile(Users users) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileJson = json.encode(users);
    return prefs.setString(SharedPreferenceKeys.USER, userProfileJson);
  }

  logOut([bool tokenExpired = false]) async {
    _status = Status.Unauthenticated;
    if (tokenExpired == true) {
      _notification = NotificationText('Session expired. Please log in again.', type: 'info');
    }
    notifyListeners();

    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }


}