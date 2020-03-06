
import 'package:flutter/material.dart';

class PaymentSuccessDialog extends StatelessWidget {
  final TextStyle subtitle = TextStyle(fontSize: 12.0, color: Colors.grey);
  final TextStyle label = TextStyle(fontSize: 14.0, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 500,
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Add Subject",style: TextStyle(color: Colors.green, fontSize: 20.0),),
                    IconButton(
                      icon: Icon(Icons.cancel),
                      color: Colors.pinkAccent,
                      iconSize: 30.0,
                      onPressed: () {

                      },
                    ),
                  ],
                ),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: const EdgeInsets.all(
                      16.0,
                    ),
                    hintText: "enter your email",
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: const EdgeInsets.all(
                      16.0,
                    ),
                    hintText: "enter your email",
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: const EdgeInsets.all(
                      16.0,
                    ),
                    hintText: "enter your email",
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: const EdgeInsets.all(
                      16.0,
                    ),
                    hintText: "enter your email",
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                  ),
                  child: RaisedButton(
                    elevation: 0,
                    highlightElevation: 0,
                    textColor: Colors.white,
                    color: Colors.pink,
                    onPressed: (){},
                    child: Text("Sign up"),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}