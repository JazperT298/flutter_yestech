import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_yestech/customviews/progress_dialog.dart';
import 'package:flutter_yestech/models/base/EventObject.dart';
import 'package:flutter_yestech/models/subject/subject.dart';
import 'package:flutter_yestech/models/user/User.dart';
import 'package:flutter_yestech/providers/subject_provider.dart';
import 'package:flutter_yestech/utils/app_shared_preferences.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'package:flutter_yestech/utils/dialogs.dart';
import 'package:flutter_yestech/widgets/dashboard/subjects/add_subject_dialog.dart';
import 'package:flutter_yestech/widgets/dashboard/subjects/manage_subject.dart';
import 'package:flutter_yestech/widgets/dashboard/subjects/payment_success_dialog.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SubjectScreen extends StatefulWidget {
  final String userid;
  final String token;

  const SubjectScreen({Key key, this.userid, this.token}) : super(key: key);


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
  List<Subject> subjectList;
  int count = 0;

  List<Subject> _subjects = [];

  //------------------------------------------------------------------------------

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (users == null) {
      await initUserProfile();
    }
    print(widget.token);
    print(widget.userid);
    _setupSubject();
  }

  //------------------------------------------------------------------------------

  Future<void> initUserProfile() async {
    Users up = await AppSharedPreferences.getUserProfile();
    setState(() {
      users = up;
    });
  }

  _setupSubject() async {
    // final String userId = Provider.of<UserData>(context).currentUserId;
    // List<Post> posts = await DatabaseService.getFeedPosts(userId);
    List<Subject> subjects = await SubjectProvider().getEducatorSubjectDetails1(widget.token, widget.userid);
    print(subjects.length);
    setState(() {
      _subjects = subjects;
    });
  }
  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

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
            getSubjectListView(),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () => _displayAlert(context),
//            Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (_) => AddSubjectDialog(),
//          ),
//        ),
      ),
    );
  }

  TextEditingController _textFieldController = TextEditingController();

  _displayAlert(BuildContext context) async{
    return Alert(
        context: context,
        title: "LOGINLOGINLOGINLOGINLOGI", //29char
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Username',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  Widget getSubjectListView () {
    return  Container(
      child: FutureBuilder(
        future: SubjectProvider().getEducatorSubjectDetails1(widget.token, widget.userid),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.data == null){
            return Container(
              child: Center(
                child: Text("Loading...."),
              ),
            );
          }else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
//                        return ListTile(
//                          title: Text(snapshot.data[index].subj_title),
//                        );
//                        return Container(
//                          decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                            boxShadow: [
//                              BoxShadow(
//                                  color: Colors.black.withOpacity(0.5),
//                                  offset: Offset(3.0, 3.0),
//                                  blurRadius: 15.0
//                              ),
//                            ],
//                          ),
//                        );
                return Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
//                                new ListTile(
////                                  leading: Icon(Icons.album),
////                                  title: Text(snapshot.data[index].subj_title),
////                                  subtitle: Text(snapshot.data[index].subj_code),
////                                  //trailing: Icon(Icons.delete),
////                                ),

                        //Subject Title
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.subject,color: Colors.redAccent,),
                                    iconSize: 25.0,
                                  ),
//                                          Image.asset(
//                                            "assets/images/ic_educator_profile.png",
//                                            height: 25.0, width: 25.0,
//                                          ),
                                  Expanded(
                                    child: Text(
                                      snapshot.data[index].subj_title,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.code,color: Colors.redAccent,),
                                    iconSize: 25.0,
                                  ),
//                                          Image.asset(
//                                            "assets/images/ic_educator_profile.png",
//                                            height: 25.0, width: 25.0,
//                                          ),
                                  Expanded(
                                    child: Text(
                                      snapshot.data[index].subj_code,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //Subject Code
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.calendar_today,color: Colors.redAccent,),
                                    iconSize: 25.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      snapshot.data[index].subj_school_year,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.account_balance,color: Colors.redAccent),
                                    iconSize: 25.0,
                                  ),
//                                          Image.asset(
//                                            "assets/images/ic_educator_profile.png",
//                                            height: 25.0, width: 25.0,
//                                          ),
                                  Expanded(
                                    child: Text(
                                      snapshot.data[index].studentCount,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //Subject School Year
//                        Padding(
//                          padding: EdgeInsets.symmetric(horizontal: 5.0),
//                          child: Column (
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Row(
//                                children: <Widget>[
//                                  IconButton(
//                                    icon: Icon(Icons.calendar_today),
//                                    iconSize: 25.0,
//                                  ),
//                                  Text(
//                                    snapshot.data[index].subj_school_year,
//                                    style: TextStyle(
//                                      fontSize: 14.0,
//                                      fontWeight: FontWeight.bold,
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ],
//                          ),
//                        ),
//                        //Subject Student Count
//                        Padding(
//                          padding: EdgeInsets.symmetric(horizontal: 5.0),
//                          child: Column (
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Row(
//                                children: <Widget>[
//                                  IconButton(
//                                    icon: Icon(Icons.account_balance),
//                                    iconSize: 25.0,
//                                  ),
//                                  Text(
//                                    snapshot.data[index].studentCount,
//                                    style: TextStyle(
//                                      fontSize: 14.0,
//                                      fontWeight: FontWeight.bold,
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ],
//                          ),
//                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('MANAGE', style: TextStyle(color: Colors.redAccent,),),
                              onPressed: () {
                                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => ManageSubject(snapshot.data[index])));
                              },
                            ),
                            FlatButton(
                              child: const Text('DELETE', style: TextStyle(color: Colors.redAccent,),),
                              onPressed: () async {
                                final action =  await Dialogs.deleteSubjectDialog(context);
                                if (action == DialogAction.Ok){
                                  print(snapshot.data[index].subj_id);
                                  _deleteSubject(users.user_token,snapshot.data[index].subj_id );
                                  _setupSubject();
                                }else {
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }


  //------------------------------------------------------------------------------
  void _deleteSubject( String token, String subj_id) async {
    EventObject eventObject = await SubjectProvider().deleteSubject( token, subj_id);
    switch (eventObject.id) {
      case EventConstants.DELETE_SUBJECT_SUCCESSFUL:
        {
          setState(() {
            _formKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.DELETE_SUBJECT_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.DELETE_SUBJECT_UN_SUCCESSFUL:
        {
          setState(() {
            _formKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.DELETE_SUBJECT_UN_SUCCESSFUL),
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
}
