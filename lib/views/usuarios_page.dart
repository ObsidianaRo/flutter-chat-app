
import 'package:chat/models/user.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  final RefreshController _refreshController = RefreshController(
      initialRefresh: false);

  final usuarios = [
    Usuario(uid: '1', name: 'Gil', email: 'test1@test.com', online: true),
    Usuario(uid: '2', name: 'Susi', email: 'test2@test.com', online: false),
    Usuario(uid: '3', name: 'Bone', email: 'test3@test.com', online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mi nombre',
            style: TextStyle(color: Colors.black54),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.exit_to_app)
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.check_circle, color: Colors.blue[400],),
            )
          ],
        ),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: () => _cargarUsuarios(),
          header: WaterDropHeader(
            complete: Icon( Icons.check, color: Colors.blue[400]),
            waterDropColor: Colors.blue,
          ),
          child: _listViewUsuarios(),
        )
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => _usuarioListTitle( usuarios[i] ),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length
    );
  }

  ListTile _usuarioListTitle( Usuario usuario ) {
    return ListTile(
      title: Text( usuario.name ),
      subtitle: Text( usuario.email ),
      leading: CircleAvatar(
        child: Text(usuario.name.substring(0,2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)
        ),
      ),
    );
  }

  _cargarUsuarios() async {

    await Future.delayed(Duration(microseconds: 1000));

    _refreshController.refreshCompleted();
  }
}


