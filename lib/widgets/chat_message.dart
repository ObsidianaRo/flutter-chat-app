
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.text, required this.uid, required this.animationController}) : super(key: key);

  final String text;
  final String uid;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeInSine),
        child: Container(
          child: uid == '123'
            ? _myMessage()
            : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.only(
            right: 5,
            bottom: 5,
            left: 50
          ),
          decoration: BoxDecoration(
            color: Color(0xff4d9ef6),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Text(
              text,
              style: TextStyle( color: Colors.white ),
          ),
        ) 
        
    );
  }

  Widget _notMyMessage() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.only(
              right: 50,
              bottom: 5,
              left: 5
          ),
          decoration: BoxDecoration(
              color: Color(0xffe4e5e8),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Text(
            text,
            style: TextStyle( color: Colors.black87 ),
          ),
        )

    );
  }

}
