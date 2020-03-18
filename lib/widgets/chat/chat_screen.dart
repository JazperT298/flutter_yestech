import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_yestech/models/chat/chat_model.dart';
import 'package:flutter_yestech/models/chat/message.dart';
import 'package:flutter_yestech/models/chat/user_model.dart';
import 'package:flutter_yestech/models/user/User.dart';
import 'package:flutter_yestech/providers/auth_provider.dart';
import 'package:flutter_yestech/services/database_service.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class ChatScreens extends StatefulWidget {

  final Users users;
  final String userId;
  final String currentUserId;
  ChatScreens({this.users, this.userId, this.currentUserId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreens> {
  final image = 'https://scontent.fcgy1-1.fna.fbcdn.net/v/t31.0-8/p960x960/30168022_1897484493619658_4342911855731560664_o.jpg?_nc_cat=104&_nc_sid=7aed08&_nc_ohc=y2wtn9SPDBAAX9b7pQC&_nc_ht=scontent.fcgy1-1.fna&_nc_tp=6&oh=ddfb6d6aa1cc075ca31b4936b06f4d60&oe=5EEE308A';

  TextEditingController _messageController = TextEditingController();
  String _message = '';
  List<Chat> _chats = [];
  @override
  void initState() {
    super.initState();
    print('SHIT');
    _setupChats();
  }

  _sendMessage() async {
    if (_message.isNotEmpty){
      Chat chat = Chat (
        sender: widget.userId,
        receiver: widget.users.user_id,
        message: _message,
        time: Timestamp.fromDate(DateTime.now()),
        unread: false,
      );
      DatabaseService.createChat(chat);
      _messageController.clear();
    }
    else{
      showToast("Can't send an empty message!", gravity: Toast.BOTTOM);
    }
  }

  _setupChats() async {
    List<Chat> chats = await DatabaseService.getUserChat(widget.users.user_id);
    setState(() {
      _chats = chats;
    });
    print(_chats.length);
  }


  _buildMessage(Chat chat, bool isMe){
    print(widget.users.user_email_address);
    print(chat.message);
    final Container msg =  Container(
      margin: widget.userId.isNotEmpty
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 9.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: widget.userId.isNotEmpty ? Theme.of(context).accentColor : Colors.grey,
        borderRadius: widget.userId.isNotEmpty ? BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ) : BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          Text (
//            chat.time.toString(),
//            style: TextStyle(
//              color: Colors.blueGrey,
//              fontSize: 16.0,
//              fontWeight: FontWeight.w600,
//            ),
//          ),
          SizedBox(height: 10.0),
          Text (
              chat.message,
          ),
        ],
      ),
    );
    if (widget.userId.isNotEmpty){
      return msg;
    }
//    return Row(
//      children: <Widget>[
//        msg,
//        IconButton(
//          icon: chat.isLiked
//              ? Icon(Icons.favorite)
//              : Icon(Icons.favorite_border),
//          iconSize: 30.0,
//          color: message.isLiked
//              ? Theme.of(context).primaryColor
//              : Colors.blueGrey,
//          onPressed: () {},
//        ),
//      ],
//    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: _messageController,
              onChanged: (input) => _message = input,
              decoration: InputDecoration.collapsed(
                hintText: 'Send Message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Container(
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: widget.users.user_image.isEmpty
                ? CachedNetworkImageProvider(image)
                : CachedNetworkImageProvider(
                widget.users.user_image),
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    itemCount: _chats.length,
                    reverse: true,
                    itemBuilder: (BuildContext context, int index){
                      final Chat chats = _chats[index];
                      print(chats.message);
                      final bool isMe = widget.users.user_id == widget.userId;
                      return _buildMessage(chats, isMe );
                    },
                    padding: EdgeInsets.only(top: 15.0),

                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}


