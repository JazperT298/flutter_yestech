import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_yestech/customviews/progress_dialog.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/screens/login_screen.dart';
import 'package:flutter_yestech/services/auth_service.dart';
import 'package:flutter_yestech/utils/constant.dart';
import 'package:flutter_yestech/utils/network_image.dart';
import 'package:flutter_yestech/utils/styles.dart';
import 'package:provider/provider.dart';

import 'package:toast/toast.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signup_screen';

  final String roleId;

  const SignupScreen({Key key, this.roleId}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  String _message = '';

  ProgressDialog progressDialog =
  ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_LOG_IN);

  TextEditingController emailController = new TextEditingController(text: "");

  TextEditingController passwordController = new TextEditingController(text: "");

  bool readTerms = false;

  void _onReadTermsChanged(bool newValue) => setState(() {
    readTerms = newValue;

    if (readTerms) {
      // TODO: Here goes your functionality that remembers the user.
    } else {
      // TODO: Forget the user
    }
  });

  Map response = new Map();

  final image = "assets/images/the_yes_logo.png";

  @override
  void initState() {
    super.initState();
    print(widget.roleId);
  }

  //Register Educator from API and Firebase
  Future<void> _registerUserEducator() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      response = await Provider.of<AuthProvider>(context)
          .registerEducator(_email, _password);
      if (response['success']) {
        AuthService.registerUsers(context, _email, _password, widget.roleId);
        Navigator.pop(context);
      } else {
        setState(() {
          _message = response['message'];
        });
      }
    }
  }

  //Register Student from API and Firebase
  Future<void> _registerUserStudent() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      response = await Provider.of<AuthProvider>(context)
          .registerStudent(_email, _password);
      if (response['success']) {
        AuthService.signUpUsers(context, _email, _password, widget.roleId);
        Navigator.pop(context);
      } else {
        setState(() {
          _message = response['message'];
        });
      }
    }
  }
  //------------------------------------------------------------------------------
  Widget _buildPageContent(BuildContext context) {
    return new Scaffold(
      key: _formKey,
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[
          _loginContainer(),
          progressDialog
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.check,
          color: Colors.green,
        ),
        backgroundColor: Colors.white,
        onPressed: () {},
      ),
    );
  }

  //------------------------------------------------------------------------------
  Widget _loginContainer() {
    return new Container(
      decoration: BoxDecoration(color: Colors.white),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/the_yes_logo.png'),
                  height: 140.0,
                  width: 140.0,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.green,
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
//------------------------------------------------------------------------------
                        _formContainer(),
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

  //------------------------------------------------------------------------------
  Widget _formContainer() {
    return new Container(
      child: new Form(
          child: new Theme(
              data: new ThemeData(primarySwatch: Colors.pink),
              child: new Column(
                children: <Widget>[
//------------------------------------------------------------------------------
                  _emailContainer(),
//------------------------------------------------------------------------------
                  _passwordContainer(),
//------------------------------------------------------------------------------
                  _confirmPasswordContainer(),
//------------------------------------------------------------------------------
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      children: <Widget>[
//------------------------------------------------------------------------------
                        _termsConditionCheckBox(),
//------------------------------------------------------------------------------
                        _termsConditionLabel(),
                      ],
                    ),
                  ),
//------------------------------------------------------------------------------
                ],
              )
          )
      ),
      margin: EdgeInsets.only(top: 100.0, left: 16.0, right: 16.0),
    );
  }

  //------------------------------------------------------------------------------
  Widget _emailContainer() {
    return new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              suffixIcon: new Icon(
                Icons.email,
                color: Colors.pink,
              ),
              border: InputBorder.none,
              hintText: Texts.EMAIL,
            ),
            keyboardType: TextInputType.emailAddress),
        margin: EdgeInsets.only(bottom: 20.0)
    );
  }

//------------------------------------------------------------------------------
  Widget _passwordContainer() {
    return new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
              suffixIcon: new Icon(
                Icons.vpn_key,
                color: Colors.pink,
              ),
              border: InputBorder.none,
              hintText: Texts.PASSWORD),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        margin: EdgeInsets.only(bottom: 20.0));
  }

  //------------------------------------------------------------------------------
  Widget _confirmPasswordContainer() {
    return new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
              suffixIcon: new Icon(
                Icons.vpn_key,
                color: Colors.pink,
              ),
              border: InputBorder.none,
              hintText: Texts.CONFIRM_PASSWORD),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        margin: EdgeInsets.only(bottom: 12.0));
  }

//------------------------------------------------------------------------------
  Widget _termsConditionLabel() {
    return new GestureDetector(
      onTap: () {},
      child: new Container(
          child: new Text(
            Texts.TERMS_CONDITION,
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          margin: EdgeInsets.only(bottom: 30.0)),
    );
  }

  //------------------------------------------------------------------------------
  Widget _termsConditionCheckBox() {
    return new Container(
        child: Checkbox(
          value: readTerms,
          onChanged: _onReadTermsChanged,
        ),
        margin: EdgeInsets.only(bottom: 30.0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
  void checkUserId(){
    if (widget.roleId == '1'){
      _registerUserEducator();
    }else if (widget.roleId == '2'){
      _registerUserStudent();
    }
  }

}
