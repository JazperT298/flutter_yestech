import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProfileScreen extends StatefulWidget {
  static final String id = 'profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}



class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only( right: 25.0, left: 25.0),
              child: Container(
                width: double.infinity,
                height: 360.0,
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
                                  icon: Icon(Icons.details),
                                  color: Colors.blueAccent,
                                  iconSize: 40.0,
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(height: 8.0,),
                              Text(
                                'Details',
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
                                  icon: Icon(Icons.account_circle),
                                  color: Colors.greenAccent,
                                  iconSize: 40.0,
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(height: 8.0,),
                              Text(
                                'Educators',
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
                                  icon: Icon(Icons.subject),
                                  color: Colors.orangeAccent,
                                  iconSize: 40.0,
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(height: 8.0,),
                              Text(
                                'Subjects',
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
                                  icon: Icon(Icons.stars),
                                  color: Colors.redAccent,
                                  iconSize: 40.0,
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(height: 8.0,),
                              Text(
                                'Stickers',
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
                                  icon: Icon(Icons.my_location),
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
                                  icon: Icon(Icons.exit_to_app),
                                  color: Colors.pinkAccent,
                                  iconSize: 40.0,
                                  onPressed: () {},
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
      ),
    );
  }
}

TextStyle _style(){
  return TextStyle(
      fontWeight: FontWeight.bold
  );
}

final String url = "http://asianwiki.com/images/c/cd/Kim_Tae-Hee-p6.jpg";

class CustomAppBar extends StatelessWidget
    with PreferredSizeWidget{

  @override
  Size get preferredSize => Size(double.infinity, 320);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 25.0),
        decoration: BoxDecoration(
            color: Colors.redAccent,
            boxShadow: [
              BoxShadow(
                  color: Colors.red,
                  blurRadius: 20,
                  offset: Offset(0, 0)
              )
            ]
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: () =>
                    Navigator.of(context).pop(),
                ),

                Text("Profile", style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),),

                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white,),
                  onPressed: (){},
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(url)
                          )
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("Soo-In-Lee", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),

                Column(
                  children: <Widget>[
                    Text("Stickers", style: TextStyle(
                        color: Colors.white
                    ),),
                    Text("100", style: TextStyle(
                        fontSize: 26,
                        color: Colors.white
                    ),)
                  ],
                ),

                Column(
                  children: <Widget>[
                    Text("Educators", style: TextStyle(
                        color: Colors.white
                    ),),
                    Text("100", style: TextStyle(
                        fontSize: 26,
                        color: Colors.white
                    ),)
                  ],
                ),


                Column(
                  children: <Widget>[
                    Text("Subjects", style: TextStyle(
                        color: Colors.white
                    ),),
                    Text("100", style: TextStyle(
                        fontSize: 26,
                        color: Colors.white
                    ),)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                Column(
                  children: <Widget>[
                    Text("Events", style: TextStyle(
                        color: Colors.white
                    ),),
                    Text("100", style: TextStyle(
                        color: Colors.white,
                        fontSize: 24
                    ),)
                  ],
                ),

                SizedBox(width: 32,),

                Column(
                  children: <Widget>[
                    Text("Daily",
                      style: TextStyle(
                          color: Colors.white
                      ),),
                    Text("100", style: TextStyle(
                        color: Colors.white,
                        fontSize: 24
                    ))
                  ],
                ),

                SizedBox(width: 16,)

              ],
            ),
            SizedBox(height: 8,),

            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: (){
                  print("//TODO: button clicked");
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 16, 0),
                  child: Transform.rotate(
                    angle: (math.pi * 0.05),
                    child: Container(
                      width: 110,
                      height: 32,
                      child: Center(child: Text("Edit Profile"),),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20
                            )
                          ]
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height - 80);
    p.lineTo(size.width, size.height);

    p.lineTo(size.width, 0);

    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
