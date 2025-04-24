import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _texController = TextEditingController();
  final _focusNode = FocusNode();

  final List<ChatMessage> _messages = [ ];

  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text('Te', style: TextStyle(fontSize: 12)),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            SizedBox(height: 3),
            Text(
              'Gilberto Mejía',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 3,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true,
              ),
            ),
            Divider(height: 1),
            Container(color: Colors.white, child: _inputChat()),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _texController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto) {
                  setState(() {
                    texto.trim().isNotEmpty
                    ? _isWriting = true
                    : _isWriting = false;
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje',
                ),
                focusNode: _focusNode,
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child:
                  Platform.isIOS
                      ? CupertinoButton(
                        child: Text('Enviar'),
                        onPressed: _isWriting
                            ? () => _handleSubmit( _texController.text )
                            :null,
                      )
                      : Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        child: IconTheme(
                          data: IconThemeData( color: Colors.blue[400] ),
                          child: IconButton(
                              highlightColor: Colors.transparent,
                              onPressed: _isWriting
                              ? () => _handleSubmit ( _texController.text )
                              : null,
                              icon: Icon( Icons.send, color: Colors.blue[400])),
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit( String texto ) {

    if( texto.length == 0 ) return;

    if (kDebugMode) {
      print( texto );
    }

    _texController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      text: texto, 
      uid: '124', 
      animationController: AnimationController(vsync: this, duration: Duration( milliseconds: 500 )));
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _isWriting = false;
    });
  }
  @override
  void dispose() {
    // TODO: Off del socket

    for( ChatMessage message in _messages ) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
