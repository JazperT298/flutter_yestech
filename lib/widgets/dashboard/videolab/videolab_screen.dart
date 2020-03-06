import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class VideolabScreen extends StatefulWidget {
  @override
  _VideolabScreenState createState() => _VideolabScreenState();
}

class _VideolabScreenState extends State<VideolabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 0,
          title: Text(
              'Video Lab'
          ),
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.indigo
                ),
                height: 200,
              ),
            ),
          ],
        ),
    );
  }
}
