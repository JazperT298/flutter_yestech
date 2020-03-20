import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_yestech/customviews/progress_dialog.dart';
import 'package:flutter_yestech/models/base/EventObject.dart';
import 'package:flutter_yestech/models/subject/subject.dart';
import 'package:flutter_yestech/models/user/User.dart';
import 'package:flutter_yestech/providers/subject_provider.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'package:flutter_yestech/widgets/dashboard/subjects/add_subject_dialog.dart';
import 'package:flutter_yestech/widgets/dashboard/subjects/payment_success_dialog.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SubjectScreen extends StatefulWidget {

  final Subject subject;
  const SubjectScreen({Key key, this.subject}) : super(key: key);
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  final _formKey = GlobalKey<ScaffoldState>();

  Subject subject;
  Users users;

  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController descriptionController = TextEditingController(text: "");
  TextEditingController sectionController = TextEditingController(text: "");
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy');
  String name = "", description = "", section = "", level = "", semester = "", schoolYear = "";

  ProgressDialog progressDialog =
  ProgressDialog.getProgressDialog(ProgressDialogTitles.SAVING);
  var _levels = ['Primary Level', 'Secondary Level', 'Tertiary Level'];
  String _currenItemSelected= 'Primary Level';
  String dropDownTertiary = '1st Semester';
  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

//    titleController.text = subject.title;
//    descriptionController.text = subject.description;
//    sectionController.text = subject.description;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          title: Text(
              'Subjects'
          ),
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red
                ),
                height: 200,
              ),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddSubjectDialog(),
          ),
        ),
      ),
    );
  }

  _addSubjectDialog( BuildContext context ) {

    TextStyle textStyle = Theme.of(context).textTheme.body2;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            key: _formKey,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(0.0)), //this right here
            child: Container(
              height: 420,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Container(
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("   Add Subject",style: TextStyle(color: Colors.white, fontSize: 20.0),),
                          IconButton(
                            icon: Icon(Icons.cancel),
                            color: Colors.white,
                            iconSize: 30.0,
                            onPressed: () {

                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(
                            8.0,
                          ),
                          hintText: "Name",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(
                            8.0,
                          ),
                          hintText: "Description(Optional)",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: sectionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(
                            8.0,
                          ),
                          hintText: "Section",
                        ),
                      ),
                    ),
                    Container(
                      width: 350.0,
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            items: _levels.map((String dropDownStringItem){
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            hint: Text("Select Level"),
                            style: textStyle,
                            value: _currenItemSelected,
                            onChanged: (String userSelectedValue){
                              _currenItemSelected = userSelectedValue;
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 350.0,
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String> (
                            value: dropDownTertiary,
                            onChanged: (valueSelectedByUser1) {
                              setState(() {
                                debugPrint('User selected $valueSelectedByUser1');
                                //updateLevelAsInt(valueSelectedByUser1);
                              });
                            },
                            items: <String> ['1st Semester', '2nd Semester', 'Summer']
                              .map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            style: textStyle,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: RaisedButton(
                        elevation: 0,
                        highlightElevation: 0,
                        textColor: Colors.white,
                        color: Colors.redAccent,
                        onPressed: () => asd(),
                        child: Text("Save"),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
  void asd(){
    schoolYear = formatter.format(now);
//    print(users.user_token);
//    print(users.user_id);
    print(nameController.text);
    print(descriptionController.text);
    print(sectionController.text);
    print(level);
    print(semester);
    print(schoolYear);
  }
  //------------------------------------------------------------------------------
  void _savinguttonAction() {

    if (nameController.text == "") {
      _formKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_EMAIL),
      ));
      return;
    }

    if (sectionController.text == "") {
      _formKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_PASS),
      ));
      return;
    }

//    if (confirmPasswordController.text == "") {
//      _formKey.currentState.showSnackBar(new SnackBar(
//        content: new Text(SnackBarText.ENTER_CON_PASS),
//      ));
//      return;
//    }


    FocusScope.of(context).requestFocus(new FocusNode());
    progressDialog.showProgress();
//    _registerSubject(
//        users.user_token, users.user_id, nameController.text, descriptionController.text, sectionController.text,
//        section, semester, schoolYear
//    );
  }

//  //------------------------------------------------------------------------------
//  void _registerSubject( String token, String userid, String name, String description, String level, String section, String semester, String schoolYear) async {
//    EventObject eventObject = await SubjectProvider().saveSubject( token, userid, name, description, level, section, semester, schoolYear);
//    switch (eventObject.id) {
//      case EventConstants.ADD_SUBJECT_SUCCESSFUL:
//        {
//          setState(() {
//            _formKey.currentState.showSnackBar(new SnackBar(
//              content: new Text(SnackBarText.REGISTER_SUCCESSFUL),
//            ));
//            progressDialog.hideProgress();
//            _goToLoginScreen();
//          });
//        }
//        break;
//      case EventConstants.USER_ALREADY_REGISTERED:
//        {
//          setState(() {
//            _formKey.currentState.showSnackBar(new SnackBar(
//              content: new Text(SnackBarText.USER_ALREADY_REGISTERED),
//            ));
//            progressDialog.hideProgress();
//          });
//        }
//        break;
//      case EventConstants.USER_REGISTRATION_UN_SUCCESSFUL:
//        {
//          setState(() {
//            _formKey.currentState.showSnackBar(new SnackBar(
//              content: new Text(SnackBarText.REGISTER_UN_SUCCESSFUL),
//            ));
//            progressDialog.hideProgress();
//          });
//        }
//        break;
//      case EventConstants.NO_INTERNET_CONNECTION:
//        {
//          setState(() {
//            _formKey.currentState.showSnackBar(new SnackBar(
//              content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
//            ));
//            progressDialog.hideProgress();
//          });
//        }
//        break;
//    }
//  }

  void updateTertiaryAsInt(String value) {
    switch (value) {
      case 'First Semester':
      //subject.level = 1 ;
        break;
      case 'Second Semester':
      //subject.level = 2;
        break;
      case 'Summer':
      //subject.level = 3;
        break;
    }
  }
//  String getTertiaryAsString(int value) {
//    String tertiary;
//    switch (value) {
//      case 1:
//        tertiary = _tertiary[0];
//        break;
//      case 2:
//        tertiary = _tertiary[1];
//        break;
//      case 3:
//        tertiary = _tertiary[2];
//        break;
//    }
//    return tertiary;
//  }
}
