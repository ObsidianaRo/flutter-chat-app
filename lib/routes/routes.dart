
import 'package:flutter/cupertino.dart';

import '../views/register_page.dart';
import '../views/usuarios_page.dart';
import '../views/chat_page.dart';
import '../views/loading_page.dart';
import '../views/login_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {

  'usuarios': ( _ ) => UsuariosPage(),
  'chat': ( _ ) => ChatPage(),
  'login': ( _ ) => LoginPage(),
  'loading': ( _ ) => LoadingPage(),
  'register': ( _ ) => RegisterPage()

};