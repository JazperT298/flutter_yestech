import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/chat/user_model.dart';
import 'package:flutter_yestech/models/user/user_educator.dart';
import 'package:flutter_yestech/models/user/users.dart';
import 'package:flutter_yestech/services/database_service.dart';
import 'package:flutter_yestech/services/storage_service.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final Users users;

 EditProfileScreen({ this.users});
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  File _profileImage;
  String _email = '';
  String _firsname = '';
  String _lastname = '';
  String _middlename = '';
  String _suffix = '';
  String _gender = '';
  String _contact_number = '';
  String _educational_attainment = '';
  String _subj_major = '';
  String _current_school = '';
  String _position = '';
  String _facebook = '';
  String _instagram = '';
  String _twitter = '';
  String _gmail = '';
  String _motto = '';
  bool _isLoading = false;

  @override 
  void initState(){
    super.initState();
    _email = widget.users.email;
  }

  _handleImageFromGallery() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null){
      setState( () {
        _profileImage = imageFile;
      });
    }
  }
  _displayProfileImage() {
    if (_profileImage == null ){
      if (widget.users.profileImageUrl.isEmpty){
        return AssetImage('assets/images/user_placeholder.png');
      }else {
        return CachedNetworkImageProvider(widget.users.profileImageUrl);
      }
    }else {
      return FileImage(_profileImage);
    }
  }

  _submit() async {
    if (_formKey.currentState.validate() && !_isLoading){
      _formKey.currentState.save();
      setState(() {
        _isLoading = true;
      });
      String _profileImageUrl = '';
      if (_profileImage == null) {
        _profileImageUrl = widget.users.profileImageUrl;
      }else {
        _profileImageUrl = await StorageService.uploadUserProfileImage(widget.users.profileImageUrl, _profileImage,);
      }
      Users users = Users (
        id: widget.users.id,
        firsname: _firsname,
        lastname: _lastname,
        middlename: _middlename,
        suffix: _suffix,
        gender: _gender,
        contact_number: _contact_number,
        educational_attainment: _educational_attainment,
        subj_major: _subj_major,
        current_school: _current_school,
        position: _position,
        facebook: _facebook,
        instagram: _instagram,
        twitter: _twitter,
        gmail: _gmail,
        motto: _motto,
        profileImageUrl: _profileImageUrl,
      );
      //Database update
      DatabaseService.updateUsers(users);
      Navigator.pop(context);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
          children: <Widget>[
            _isLoading
            ? LinearProgressIndicator(
              backgroundColor: Colors.blue[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            )
            : SizedBox.shrink(),
             Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey, 
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: 
                      _displayProfileImage(),
                    ),
                    FlatButton(
                      onPressed: _handleImageFromGallery,
                      child: Text(
                        'Change Profile image',
                         style: TextStyle(
                           color: Theme.of(context).accentColor, 
                           fontSize: 16.0,
                        ),
                      ),
                    ),
                    TextFormField(
                      initialValue: _firsname,
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'First name',
                      ),
                      validator: (input) => input.trim().length < 1
                      ? 'Please enter a valid firstname'
                      : null,
                       onSaved: (input) => _firsname = input,
                    ),
                    TextFormField(
                      initialValue: _lastname,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Last name',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid lastname'
                          : null,
                      onSaved: (input) => _lastname = input,
                    ),
                    TextFormField(
                      initialValue: _middlename,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Middle name',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid middlename'
                          : null,
                      onSaved: (input) => _middlename = input,
                    ),
                    TextFormField(
                      initialValue: _suffix,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Suffix',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid suffix'
                          : null,
                      onSaved: (input) => _suffix = input,
                    ),
                    TextFormField(
                      initialValue: _gender,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Gender',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid gender'
                          : null,
                      onSaved: (input) => _gender = input,
                    ),
                    TextFormField(
                      initialValue: _contact_number,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Contact Number',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid number'
                          : null,
                      onSaved: (input) => _contact_number = input,
                    ),
                    TextFormField(
                      initialValue: _educational_attainment,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Educational Attainment',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid Educational Attainment'
                          : null,
                      onSaved: (input) => _educational_attainment = input,
                    ),
                    TextFormField(
                      initialValue: _subj_major,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Major Subject',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid subject'
                          : null,
                      onSaved: (input) => _subj_major = input,
                    ),
                    TextFormField(
                      initialValue: _current_school,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Current School',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid School'
                          : null,
                      onSaved: (input) => _current_school = input,
                    ),
                    TextFormField(
                      initialValue: _position,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Position',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid position'
                          : null,
                      onSaved: (input) => _position = input,
                    ),
                    TextFormField(
                      initialValue: _facebook,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Facebook',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid facebook account'
                          : null,
                      onSaved: (input) => _facebook = input,
                    ),
                    TextFormField(
                      initialValue: _instagram,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Instagram',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid instagram account'
                          : null,
                      onSaved: (input) => _instagram = input,
                    ),
                    TextFormField(
                      initialValue: _twitter,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Twitter',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid twitter account'
                          : null,
                      onSaved: (input) => _twitter = input,
                    ),
                    TextFormField(
                      initialValue: _gmail,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Gmail',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid gmail account'
                          : null,
                      onSaved: (input) => _gmail = input,
                    ),
                    TextFormField(
                      initialValue: _motto,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                        labelText: 'Motto',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid Motto'
                          : null,
                      onSaved: (input) => _motto = input,
                    ),
                    Container(
                      margin: EdgeInsets.all(40.0),
                      height: 40.0,
                      width: 250.0,
                      child: FlatButton(
                        onPressed: _submit,
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text(
                          'Save Profile',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
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
    );
  }
}