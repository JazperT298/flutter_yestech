import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final _firestore = Firestore.instance;
final storageRef = FirebaseStorage.instance.ref();
final usersRef = _firestore.collection('users');
final postsRef = _firestore.collection('posts');
final followersRef = _firestore.collection('followers');
final followingRef = _firestore.collection('following');
final feedsRef = _firestore.collection('feeds');
final likesRef = _firestore.collection('likes');
final commentsRef = _firestore.collection('comments');
final activitiesRef = _firestore.collection('activities');
final chatsRef = _firestore.collection('chats');

///////////////////////////////////////////////////////////////////////////////
class APIConstants {
  static const String OCTET_STREAM_ENCODING = "application/octet-stream";
  static const String API_BASE_URL = 'http://192.168.1.6/yes_tech/controllerClass';
  static const String API_BASE_LIVE_URL = 'https://theyestech.com/controllerClass';
  static const String API_IMAGE_BASE_LIVE_URL = 'https://theyestech.com/user_images/';

}

class APIOperations {
  static const String LOGIN = "login";
  static const String REGISTER = "register";
  static const String CHANGE_PASSWORD = "chgPass";
  static const String SUCCESS = "success";
  static const String FAILURE = "failure";
}

class EventConstants {
  static const int NO_INTERNET_CONNECTION = 0;

  static const int LOGIN_USER_SUCCESSFUL = 500;
  static const int LOGIN_USER_UN_SUCCESSFUL = 501;

  static const int USER_REGISTRATION_SUCCESSFUL = 502;
  static const int USER_REGISTRATION_UN_SUCCESSFUL = 503;
  static const int USER_ALREADY_REGISTERED = 504;

  static const int CHANGE_PASSWORD_SUCCESSFUL = 505;
  static const int CHANGE_PASSWORD_UN_SUCCESSFUL = 506;
  static const int INVALID_OLD_PASSWORD = 507;

  static const int ADD_SUBJECT_SUCCESSFUL = 508;
  static const int ADD_SUBJECT_UN_SUCCESSFUL = 509;
  static const int SUBJECT_ALREADY_REGISTERED = 510;
  static const int DELETE_SUBJECT_SUCCESSFUL = 511;
  static const int DELETE_SUBJECT_UN_SUCCESSFUL = 512;

  static const int GET_USER_SUBJECT_SUCCESSFUL = 513;
  static const int GET_USER_SUBJECT_UN_SUCCESSFUL = 514;

  static const int ADD_STUDENT_TO_SUBJECT_SUCCESSFUL = 515;
  static const int ADD_STUDENT_TO_SUBJECT_UNSUCCESSFUL = 516;
  static const int STUDENT_ALREADY_ADDED_TO_SUBJECT = 517;
  static const int DELETE_STUDENT_SUCCESSFUL = 518;
  static const int DELETE_STUDENT_UN_SUCCESSFUL = 519;
}

class APIResponseCode {
  static const int SC_OK = 200;
}

class SharedPreferenceKeys {
  static const String IS_USER_LOGGED_IN = "IS_USER_LOGGED_IN";
  static const String USER = "USER";
}

class ProgressDialogTitles {
  static const String IN_PROGRESS = "In Progress...";
  static const String USER_LOG_IN = "Logging In...";
  static const String SAVING = "Saving...";
  static const String USER_CHANGE_PASSWORD = "Changing...";
  static const String USER_REGISTER = "Registering...";
}

class SnackBarText {
  static const String NO_INTERNET_CONNECTION = "No Internet Conenction";
  static const String LOGIN_SUCCESSFUL = "Login Successful";
  static const String LOGIN_UN_SUCCESSFUL = "Login Un Successful";
  static const String CHANGE_PASSWORD_SUCCESSFUL = "Change Password Successful";
  static const String CHANGE_PASSWORD_UN_SUCCESSFUL =
      "Change Password Un Successful";
  static const String REGISTER_SUCCESSFUL = "Register Successful";
  static const String REGISTER_UN_SUCCESSFUL = "Register Un Successful";
  static const String USER_ALREADY_REGISTERED = "User Already Registered";
  static const String ENTER_PASS = "Please Enter your Password";
  static const String ENTER_CON_PASS = "Confirm your Password";
  static const String ENTER_NEW_PASS = "Please Enter your New Password";
  static const String ENTER_OLD_PASS = "Please Enter your Old Password";
  static const String ENTER_EMAIL = "Please Enter your Email Id";
  static const String ENTER_VALID_MAIL = "Please Enter Valid Email Id";
  static const String ENTER_NAME = "Please Enter your Name";
  static const String INVALID_OLD_PASSWORD = "Invalid Old Password";
  static const String PASSWORD_NOT_MATCH = "Password didn't match, Please try again";
  static const String TERMS_CONDITION = "Please accept Terms and Condition";
  static const String ADD_SUBJECT_SUCCESSFUL = "Add Subject Successful";
  static const String ADD_SUBJECT_UN_SUCCESSFUL = "Add Subject Un Successful";
  static const String SUBJECT_ALREADY_REGISTERED = "Subject Already Registerted";
  static const String DELETE_SUBJECT_SUCCESSFUL = "Delete Subject Successful";
  static const String DELETE_SUBJECT_UN_SUCCESSFUL = "Delete Subject Un Successful";
  static const String GET_USER_SUBJECT_SUCCESSFUL = "";
  static const String GET_USER_SUBJECT_UN_SUCCESSFUL = "";
  static const String ADD_STUDENT_TO_SUBJECT_SUCCESSFUL = "Student Added Successfully";
  static const String ADD_STUDENT_TO_SUBJECT_UNSUCCESSFUL = "Student Added Unsuccessful";
  static const String STUDENT_ALREADY_ADDED = "Student Already Added";
  static const String DELETE_STUDENT_SUCCESSFUL = "Delete Student Successful";
  static const String DELETE_STUDENT_UN_SUCCESSFUL = "Delete Student Un Successful";

}

class Texts {
  static const String REGISTER_NOW = "New here ? Sign up Now.";
  static const String LOGIN_NOW = "Already Registered ? Login Now !";
  static const String LOGIN = "LOGIN";
  static const String REGISTER = "REGISTER";
  static const String PASSWORD = "Password";
  static const String CONFIRM_PASSWORD = "Confirm Password";
  static const String OLD_PASSWORD = "Old Password";
  static const String NEW_PASSWORD = "New Password";
  static const String CHANGE_PASSWORD = "CHANGE PASSWORD";
  static const String LOGOUT = "LOGOUT";
  static const String EMAIL = "Email";
  static const String NAME = "Name";
  static const String FORGOT_PASSWORD = "Forgot password?";
  static const String TERMS_CONDITION = "I have read Terms and Conditions?";
}
