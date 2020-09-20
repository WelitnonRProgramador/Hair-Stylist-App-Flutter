import 'package:app_barbearia/modelos/GerenciadorPaginas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TituloDrawer extends StatelessWidget {

  TituloDrawer({this.iconData, this.titulo, this.page});

  final IconData iconData;
  final String titulo;
  final int page;

  @override
  Widget build(BuildContext context) {

    final int paginaAtual = context.watch<GerenciadorPaginas>().page;

    return InkWell(
      onTap: (){
        context.read<GerenciadorPaginas>().setPagina(page);
        
      },
      child: SizedBox( 
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32 
              ),
          
            child: Icon(
              iconData, 
              size: 32,
              color: paginaAtual == page? Colors.red: Colors.grey[700],
              ),
            ),

          Text(
            titulo,
            style: TextStyle(
              fontSize: 16,
              color: paginaAtual == page? Colors.red: Colors.grey[700],
            ),
          )
        ],
      )
      ),
    );
  }
}