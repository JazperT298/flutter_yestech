import 'package:flutter/material.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/services/auth_service.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu'
        ),
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 350.0,
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0, right: 25.0, left: 25.0),
            child: Container(
              width: double.infinity,
              height: 700.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0.0, 3.0),
                    blurRadius: 15.0
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.blue.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: Icon(Icons.info),
                                color: Colors.blueAccent,
                                iconSize: 40.0,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Text(
                              'About',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.green.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: Icon(Icons.assessment),
                                color: Colors.greenAccent,
                                iconSize: 40.0,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Text(
                              'Assessment',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.orange.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: Icon(Icons.note),
                                color: Colors.orangeAccent,
                                iconSize: 40.0,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Text(
                              'Notes',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.red.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: Icon(Icons.warning),
                                color: Colors.redAccent,
                                iconSize: 40.0,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Text(
                              'Privacy',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.purple.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: Icon(Icons.payment),
                                color: Colors.purpleAccent,
                                iconSize: 40.0,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Text(
                              'Policy',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.pink.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: Icon(Icons.settings),
                                color: Colors.pinkAccent,
                                iconSize: 40.0,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Text(
                              'Settings',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.indigo.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: Icon(Icons.exit_to_app),
                                color: Colors.indigoAccent,
                                iconSize: 40.0,
                                onPressed: () {
                                  Provider.of<AuthProvider>(context).logOut();
                                  AuthService.logoutEducator();
                                  Navigator.pop(context);
                                }
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Text(
                              'Logout',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],

      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
