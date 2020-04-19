
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/screens/start_screen.dart';
import 'package:flutter_yestech/utils/app_shared_preferences.dart';

enum DialogAction { Ok, Cancel}
class Dialogs {
  static Future<DialogAction> logoutDialog(BuildContext context) async{
    final action = await showDialog(context: context, barrierDismissible: false, builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text(
          "Confirm Logout",
          style: new TextStyle(color: Colors.blue[400], fontSize: 20.0),
        ),
        content: new Text(
          "Are you sure you want to Logout from the App?",
          style: new TextStyle(color: Colors.grey, fontSize: 20.0),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text("OK",
                style: new TextStyle(color: Colors.blue[400], fontSize: 20.0)),
            onPressed: () => Navigator.of(context).pop(DialogAction.Ok),
//            {
//              AppSharedPreferences.clear();
//              Navigator.pushReplacement(
//                context,
//                new MaterialPageRoute(builder: (context) => new StartScreen()),
//              );
//            },
          ),
          new FlatButton(
            child: new Text("Cancel",
                style: new TextStyle(color: Colors.blue[400], fontSize: 20.0)),
            onPressed: () => Navigator.of(context).pop(DialogAction.Cancel),
//            {
//              Navigator.of(context).pop();
//            },
          ),
        ],
      );
    });
    return (action != null) ? action : DialogAction.Cancel;
  }

  static Future<DialogAction> deleteSubjectDialog(BuildContext context) async{
    final action = await showDialog(context: context, barrierDismissible: false, builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text(
          "Confirm Delete",
          style: new TextStyle(color: Colors.blue[400], fontSize: 20.0),
        ),
        content: new Text(
          "Are you sure you want to Delete this subject?",
          style: new TextStyle(color: Colors.grey, fontSize: 20.0),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text("OK",
                style: new TextStyle(color: Colors.blue[400], fontSize: 20.0)),
            onPressed: () => Navigator.of(context).pop(DialogAction.Ok),
          ),
          new FlatButton(
            child: new Text("Cancel",
                style: new TextStyle(color: Colors.blue[400], fontSize: 20.0)),
            onPressed: () => Navigator.of(context).pop(DialogAction.Cancel),
          ),
        ],
      );
    });
    return (action != null) ? action : DialogAction.Cancel;
  }

  static Future<DialogAction> exitAppDialog(BuildContext context) async{
    final action = await showDialog(context: context, barrierDismissible: false, builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text(
          "Confirm Exit",
          style: new TextStyle(color: Colors.blue[400], fontSize: 20.0),
        ),
        content: new Text(
          "Are you sure you want to Exit the App?",
          style: new TextStyle(color: Colors.grey, fontSize: 20.0),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text("OK",
                style: new TextStyle(color: Colors.blue[400], fontSize: 20.0)),
            onPressed: () => Navigator.of(context).pop(DialogAction.Ok),
          ),
          new FlatButton(
            child: new Text("Cancel",
                style: new TextStyle(color: Colors.blue[400], fontSize: 20.0)),
            onPressed: () => Navigator.of(context).pop(DialogAction.Cancel),
          ),
        ],
      );
    });
    return (action != null) ? action : DialogAction.Cancel;
  }
}