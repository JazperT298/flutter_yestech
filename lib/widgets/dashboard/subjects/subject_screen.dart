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

  Subject subject;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

  String name = "", description = "", section = "", level = "", semester = "", schoolYear = "";

  String dropDownLevel= 'Primary Level';
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
        onPressed: () => _addSubjectDialog(context),
      ),
    );
  }

  _addSubjectDialog( BuildContext context ) {

    TextStyle textStyle = Theme.of(context).textTheme.body2;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
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
                            style: textStyle,
                            value: dropDownLevel,
                            onChanged: (valueSelectedByUser) {
                              setState(() {
                                debugPrint('User selected $valueSelectedByUser');
                                updateLevelAsInt(valueSelectedByUser);
                              });
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
                                updateLevelAsInt(valueSelectedByUser1);
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
                        onPressed: (){},
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
