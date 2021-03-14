import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                  'https://avatars3.githubusercontent.com/u/66957319?s=400&u=cd4df0aa31a432e77b14a1b853f705f62fb5d2be&v=4'),
            ),
            accountName: Text('Nathã Luca'),
            accountEmail: Text('natha.luca.pereira.lopes@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Início'),
            subtitle: Text('Tela principal'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            subtitle: Text('Encerrar sessão'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/login'),
          ),
          ListTile(
            leading: Icon(Icons.help_center),
            title: Text("Suporte"),
            subtitle: Text("Peça ajuda ao suporte"),
          ),
          ListTile(
            leading: Icon(Icons.read_more),
            title: Text("Tutorial"),
            subtitle: Text("Refazer tutorial"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/tutorial'),
          ),
        ],
      ),
    );
  }
}
