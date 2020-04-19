import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class NewTopic extends StatefulWidget {
  @override
  _NewTopicState createState() => _NewTopicState();
}

class _NewTopicState extends State<NewTopic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'New Topic'
        ),
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
