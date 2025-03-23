

import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        width: 190,
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/tag-logo.png')),
            SizedBox(height: 20),
            Text( title,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}