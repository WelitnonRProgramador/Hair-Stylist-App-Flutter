import 'package:app_barbearia/Comum/Drawer_Costomizado/TituloDrawer.dart';
import 'package:flutter/material.dart';

class DrawerCostomizado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[ 
          TituloDrawer(iconData: Icons.home, titulo: "Inicio", page: 0),
          TituloDrawer(iconData: Icons.list, titulo: "Agenda",page: 1),
          TituloDrawer(iconData: Icons.playlist_add_check, titulo: "Meus Agendamentos",page: 2),
          TituloDrawer(iconData: Icons.location_on, titulo: "Proficionais",page: 3),
          
        ],
      ),
    );
  }
}