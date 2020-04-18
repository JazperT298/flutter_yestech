import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_yestech/customviews/progress_dialog.dart';
import 'package:flutter_yestech/models/base/EventObject.dart';
import 'package:flutter_yestech/models/subject/subject.dart';
import 'package:flutter_yestech/models/user/User.dart';
import 'package:flutter_yestech/providers/subject_provider.dart';
import 'package:flutter_yestech/utils/app_shared_preferences.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'package:intl/intl.dart';

class AddSubjectDialog extends StatefulWidget {
  @override
  _AddSubjectDialogState createState() => _AddSubjectDialogState();
}

class _AddSubjectDialogState extends State<AddSubjectDialog> {
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
  String _currentItemSelected= 'Primary Level';
  String _dropDownTertiary = '1st Semester';


  //------------------------------------------------------------------------------

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (users == null) {
      await initUserProfile();
    }
  }

  //------------------------------------------------------------------------------

  Future<void> initUserProfile() async {
    Users up = await AppSharedPreferences.getUserProfile();
    setState(() {
      users = up;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.body2;
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Text(
            'Add Subject'
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
          Container(
            child: ListView(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
//------------------------------------------------------------------------------
                      _formContainer(),

                      progressDialog
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () => _savinguttonAction(),
      ),
    );
  }
  //------------------------------------------------------------------------------
  Widget _formContainer() {
    return new Container(
      child: new Form(
          child: new Theme(
              data: new ThemeData(primarySwatch: Colors.pink),
              child: new Column(
                children: <Widget>[
//------------------------------------------------------------------------------
                  _nameContainer(),
//------------------------------------------------------------------------------
                  _descriptionContainer(),
//------------------------------------------------------------------------------
                  _sectionContainer(),
//------------------------------------------------------------------------------
                  _levelContainer(),
//------------------------------------------------------------------------------
                  _tertiaryContainer(),
                ],
              )
          )
      ),
      margin: EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
    );
  }
  Widget _nameContainer() {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: TextField(
          controller: nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(
              8.0,
            ),
            hintText: "Name",
            hoverColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _descriptionContainer() {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
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
    );
  }

  Widget _sectionContainer() {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
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
    );
  }

  Widget _levelContainer() {
    TextStyle textStyle = Theme.of(context).textTheme.body2;
    return Container(
      width: 370.0,
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
            value: _currentItemSelected,
            onChanged: (String userSelectedValue){
              _dropDownItemSelected(userSelectedValue);
            },
          ),
        ),
      ),
    );
  }

  Widget _tertiaryContainer() {
    TextStyle textStyle = Theme.of(context).textTheme.body2;
    return  Container(
      width: 370.0,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String> (
            value: _dropDownTertiary,
            onChanged: (valueSelectedByUser1) {
              setState(() {
                debugPrint('User selected $valueSelectedByUser1');
                _dropDownItemSelected2(valueSelectedByUser1);
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
    );
  }
  void _dropDownItemSelected(String userSelectedValue){
    setState(() {
      this._currentItemSelected = userSelectedValue;
    });
  }
  void _dropDownItemSelected2(String userSelectedValue){
    setState(() {
      this._dropDownTertiary = userSelectedValue;
    });
  }

  void asd(){
    schoolYear = formatter.format(now);
    print(users.user_token);
    print(users.user_id);
    print(nameController.text);
    print(descriptionController.text);
    print(sectionController.text);
    print(_currentItemSelected);
    print(_dropDownTertiary);
    print(schoolYear);
  }

  //------------------------------------------------------------------------------
  void _savinguttonAction() {
    schoolYear = formatter.format(now);
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
    //asd();
    _registerSubject(
        users.user_token, users.user_id, nameController.text, descriptionController.text, sectionController.text,
        section, semester, schoolYear
    );
  }
  //------------------------------------------------------------------------------
  void _registerSubject( String token, String userid, String name, String description, String level, String section, String semester, String schoolYear) async {
    EventObject eventObject = await SubjectProvider().saveSubject( token, userid, name, description, level, section, semester, schoolYear);
    switch (eventObject.id) {
      case EventConstants.ADD_SUBJECT_SUCCESSFUL:
        {
          setState(() {
            _formKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.ADD_SUBJECT_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
            Navigator.pop(context);
          });
        }
        break;
      case EventConstants.SUBJECT_ALREADY_REGISTERED:
        {
          setState(() {
            _formKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.SUBJECT_ALREADY_REGISTERED),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.ADD_SUBJECT_UN_SUCCESSFUL:
        {
          setState(() {
            _formKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.ADD_SUBJECT_UN_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.NO_INTERNET_CONNECTION:
        {
          setState(() {
            _formKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
    }
  }
}
