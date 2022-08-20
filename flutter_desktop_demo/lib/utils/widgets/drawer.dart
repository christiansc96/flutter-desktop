import 'package:flutter/material.dart';
import 'package:flutter_desktop_demo/utils/widgets/alert_dialog_sign_out.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 9,
      child: _buildMenu(context),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Column(children: <Widget>[
      DrawerHeader(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage('assets/latino-net-online.jpg'),
          ),
        ),
        child: Container(),
      ),
      Expanded(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            _buildSignOut(context),
            const SizedBox(height: 100),
          ],
        ),
      ),
      Container(
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          child: const Text(
            "©2022 @christiansc96",
            style: TextStyle(
              fontSize: 15.5,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ))
    ]);
  }

  Widget _buildSignOut(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.exit_to_app),
      title: const Text(
        'Cerrar Sesión',
        style: TextStyle(
          fontSize: 16.2,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        _showIsLoggedinDialog(context);
      },
    );
  }

  Future _showIsLoggedinDialog(context) {
    return showDialog(
      builder: (context) {
        return const AlertSignOut();
      },
      context: context,
    );
  }
}
