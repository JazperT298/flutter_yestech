import 'package:flutter/material.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/screens/login_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {

  static final String id = 'start_screen';

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  String shit = 'http://192.168.1.11/yes_tech/controllerClass/controller_educator/login_as_educator_class.php';
  String fuck = 'http://192.168.1.11/yes_tech/controllerClass/controller_educator/register_as_educator_class.php';
  final _minimumPadding = 5.0;

  initAuthProvider(context) async {
    Provider.of<AuthProvider>(context).initAuthProvider();
  }

  @override
  Widget build(BuildContext context) {

    initAuthProvider(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 59.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/bg_image_start.png',
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.green),
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) => LoginScreen(roleId: '2')
                          ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Text(
                              'Student',
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) => LoginScreen(roleId: '1')
                          ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Text(
                              'Educator',
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

}
