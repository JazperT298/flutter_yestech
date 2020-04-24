import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_yestech/models/subject/subject.dart';
import 'package:flutter_yestech/providers/subject_provider.dart';
import 'package:flutter_yestech/screens/home_screen.dart';
import 'package:flutter_yestech/screens/profile_screen.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewStudents extends StatefulWidget {
  final String subj_id;

  ViewStudents(this.subj_id);
  @override
  _ViewStudentsState createState() => _ViewStudentsState();
}

class _ViewStudentsState extends State<ViewStudents> {
  Subject subject;
  final image = 'https://scontent.fcgy1-1.fna.fbcdn.net/v/t31.0-8/p960x960/30168022_1897484493619658_4342911855731560664_o.jpg?_nc_cat=104&_nc_sid=7aed08&_nc_ohc=y2wtn9SPDBAAX9b7pQC&_nc_ht=scontent.fcgy1-1.fna&_nc_tp=6&oh=ddfb6d6aa1cc075ca31b4936b06f4d60&oe=5EEE308A';

  TextEditingController codeController = TextEditingController(text: "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.subj_id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'View Students'
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choices) {
                return PopupMenuItem<String>(
                  value: choices,
                  child: Text(
                      choices
                  ),
                );
              }).toList();
            },
          ),

        ],
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.yellow
              ),
              height: 200,
            ),
          ),
          getStudentListView(),
        ],

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
        onPressed: () => showFancyCustomDialog(context),
      ),
    );
  }



  Widget getStudentListView () {
    return  Container(
      child: FutureBuilder(
        future: SubjectProvider().getStudentDetails(widget.subj_id),
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                leading: CircleAvatar(
//                                    backgroundImage: NetworkImage(
//                                    snapshot.data[index].user_image
                                    backgroundImage: snapshot.data[index].user_image == null || snapshot.data[index].user_image == 'null'
                                        ? NetworkImage(image) : NetworkImage(APIConstants.API_IMAGE_BASE_LIVE_URL+snapshot.data[index].user_image),
                                          //? CachedNetworkImageProvider(image)
                                        //: CachedNetworkImageProvider(snapshot.data[index].user_image),
                              ),
                            title: Text(snapshot.data[index].user_firstname + " " + snapshot.data[index].user_lastname),
                            subtitle: Text(snapshot.data[index].user_email_address),
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


  _addStudentDialog(BuildContext contexts) async{
    return Alert(
        context: contexts,
        title: "LOGIN ADD STUDENT NLOGINL", //27char
        content: Column(
          children: <Widget>[
//            InkWell(
//            onTap: () {
//              Navigator.of(context, rootNavigator: true).pop();
//              },
//            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: TextField(
                  controller: codeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: const EdgeInsets.all(
                      8.0,
                    ),
                    hintText: "Code",
                    hoverColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.of(contexts, rootNavigator: true).pop(),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }


  void showFancyCustomDialog(BuildContext context) {
    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 200.0,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: codeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: const EdgeInsets.all(
                        8.0,
                      ),
                      hintText: "Code",
                      hoverColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Add Student",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              // These values are based on trial & error method
              alignment: Alignment(1.05, -1.05),
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
  }

  void choiceAction(String choice){
    if (choice == Constants.Dashboard){
      print('Dashboard');
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (_) => HomeScreen()),);
    }
    else if (choice == Constants.Profile){
      //Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfileScreen(users: _profileUser,)),);
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (_) => ProfileScreen()),);
    }
  }
}


class Constants {
  static const String Dashboard = 'Dashboard';
  static const String Profile = 'Profile';

  static const List<String> choices = <String>[
    Dashboard,
    Profile
  ];
}
