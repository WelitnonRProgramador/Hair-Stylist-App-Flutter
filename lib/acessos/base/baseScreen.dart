import 'package:app_barbearia/Comum/Drawer_costomizado/drawerCostomizado.dart';
import 'package:app_barbearia/modelos/GerenciadorPaginas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
final PageController pageController = PageController();

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final PageController pageController = PageController();

    return Provider(
      create: (_) => GerenciadorPaginas(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Scaffold(
            drawer: DrawerCostomizado(),
            appBar: AppBar(
              title: const Text('Hair Stylist'),
            ),
          ),

          Scaffold(
            drawer: DrawerCostomizado(),
            appBar: AppBar(
              title: const Text('Hair Stylist1'),
            ),
          ),

          Scaffold(
            drawer: DrawerCostomizado(),
            appBar: AppBar(
              title: const Text('Hair Stylist2'),
            ),
          ),

          Scaffold(
            drawer: DrawerCostomizado(),
            appBar: AppBar(
              title: const Text('Hair Stylist3'),
            ),
          ),

          Container(color: Colors.red,),
          Container(color: Colors.blue),
          Container(color: Colors.green),

        ],
      ),
    );
  }
}