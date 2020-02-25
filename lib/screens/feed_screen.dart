import 'package:flutter/material.dart';
import 'package:flutter_yestech/models/post_model.dart';
import 'package:flutter_yestech/screens/profile_screen.dart';
import 'package:flutter_yestech/widgets/post_view.dart';

class FeedScreen extends StatefulWidget {

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  List<Post> _posts = [];
  int count = 0;

  @override
  void initState() {
    super.initState();
    _setupFeed();
  }

  _setupFeed() {
    // final String userId = Provider.of<UserData>(context).currentUserId;
    // List<Post> posts = await DatabaseService.getFeedPosts(userId);
    List<Post> posts = Post.posts;
    print(posts.length);
    setState(() {
      _posts = posts;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, ProfileScreen.id),
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/images/soo.jpg'),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Soo-In-Lee'
                ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
            ),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: (){},
          ),
        ],
      ),
      body: _posts.length > 0 ?
      RefreshIndicator(
        onRefresh: () => _setupFeed(),
        child :ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (BuildContext context, int index){
            Post post = _posts[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(3.0, 3.0),
                      blurRadius: 15.0
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileScreen(
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
                            backgroundImage: AssetImage(post.imageUrl),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                post.authorName,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                post.date,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

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
                              image:  AssetImage(post.postImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox.shrink(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0),
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                left: 12.0,
                                right: 6.0,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                post.caption + ' asdasdasd asd asd ',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.favorite),
                              iconSize: 30.0,
                            ),
                            Text(
                              '${post.likeCount.toString()} likes',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.comment),
                              iconSize: 30.0,
                              onPressed: () {},
                            ),
                            Text(
                              '${post.commentCount.toString()} comments',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            IconButton(
                              icon: Icon(Icons.bookmark),
                              iconSize: 30.0,
                              onPressed: () {},
                            ),
                            Text(
                              '${post.favoriteCount.toString()} Favorites',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ],
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ],

              ),
            );
          },
        ),

      ): Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
