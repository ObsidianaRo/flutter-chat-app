import 'package:chat/widgets/btn_blue.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_input.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Logo( title: 'register'),
                  _FormState(),
                  Labels( route: 'login', titulo: '¿Ya tienes cuenta?', subtitulo: 'Haz Login',),
                  Text('Términos y condiciones de uso',
                    style: TextStyle(
                        fontWeight:  FontWeight.w200
                    ),)
                ],
              ),
            ),
          ),
        )
    );
  }
}


class _FormState extends StatefulWidget {

  @override
  State<_FormState> createState() => _FormStateState();
}

class _FormStateState extends State<_FormState> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:40),
      padding: EdgeInsets.symmetric( horizontal: 50 ),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Name',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_clock_outlined,
            placeholder: 'password',
            keyboardType: TextInputType.text,
            textController: passCtrl,
            isPassword: true,
          ),
          BtnAzul(
            text: 'Register',
            onPressed: () {
              print(emailCtrl.text);
              print(passCtrl.text);
            },

          )
        ],
      ),
    );
  }
}







