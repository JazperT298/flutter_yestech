import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_yestech/models/subject/subject.dart';
import 'package:flutter_yestech/widgets/dashboard/subjects/payment_success_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SubjectScreen extends StatefulWidget {

  final Subject subject;

  const SubjectScreen({Key key, this.subject}) : super(key: key);
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {

  static var _levels = ['Primary Level', 'Secondary Level', 'Tertiary Level'];

  static var _tertiary = ['First Semester', 'Second Semester', 'Summer'];

  Subject subject;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

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
        onPressed: () => _addSubjectDialog(context),
      ),
    );
  }

  _addSubjectDialog( BuildContext context ) {

    TextStyle textStyle = Theme.of(context).textTheme.title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(0.0)), //this right here
            child: Container(
              height: 400,
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(
                            16.0,
                          ),
                          hintText: "enter your email",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(
                            16.0,
                          ),
                          hintText: "enter your email",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(
                            16.0,
                          ),
                          hintText: "enter your email",
                        ),
                      ),
                    ),
                    ListTile(
                      title: DropdownButton(
                        items: _levels.map((String dropDownStringItem){
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        style: textStyle,
                        //value: getLevelAsString(note.priority),
                        onChanged: (valueSelectedByUser) {
                          setState(() {
                            debugPrint('User selected $valueSelectedByUser');
                            updateLevelAsInt(valueSelectedByUser);
                          });
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                      ),
                      child: RaisedButton(
                        elevation: 0,
                        highlightElevation: 0,
                        textColor: Colors.white,
                        color: Colors.pink,
                        onPressed: (){},
                        child: Text("Sign up"),
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

  void updateLevelAsInt(String value) {
    switch (value) {
      case 'Primary Level':
        //subject.level = 1 ;
        break;
      case 'Secondary Level':
        //subject.level = 2;
        break;
      case 'Tertiary Level':
        //subject.level = 3;
        break;
    }
  }
  String getLevelAsString(int value) {
    String levels;
    switch (value) {
      case 1:
        levels = _levels[0];
        break;
      case 2:
        levels = _levels[1];
        break;
      case 3:
        levels = _levels[2];
        break;
    }
    return levels;
  }
}
