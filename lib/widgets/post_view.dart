import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/post_model.dart';
import 'package:flutter_yestech/screens/profile_screen.dart';

class PostView extends StatefulWidget {
  final String currentUserId;
  final Post post;

  PostView({this.currentUserId, this.post});
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {

  int _likeCount = 0;
  bool _isLiked = false;
  bool _heartAnim = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProfileScreen(
//                currentUserId: widget.currentUserId,
//                userId: widget.post.authorId,
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/images/user_placeholder.png')
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  '',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          // onDoubleTap: _likePost,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.post.imageUrl
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              _heartAnim ? Animator (
                duration: Duration(milliseconds: 300),
                tween: Tween(begin: 0.5, end: 1.4),
                curve: Curves.elasticOut,
                builder: (anim) => Transform.scale(
                  scale: anim.value,
                  child: Icon(
                    Icons.favorite,
                    size: 10.0,
                    color: Colors.red[400],
                  ),
                ),
              )
                  : SizedBox.shrink(),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: _isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                    iconSize: 30.0,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.comment),
                    iconSize: 30.0,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
//                        builder: (_) => CommentsScreen(
//                          post: widget.post,
//                          likeCount: _likeCount,
//                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  '${_likeCount.toString()} likes',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      left: 12.0,
                      right: 6.0,
                    ),
                    child: Text(
                      '',
                      style: TextStyle(

                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.post.caption + 'asdasdasd asd asd',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
