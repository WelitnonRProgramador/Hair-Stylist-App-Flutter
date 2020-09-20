

import 'package:flutter/cupertino.dart';

class GerenciadorPaginas{

  GerenciadorPaginas(this._pageController);

  PageController _pageController;

  int page = 0;

  void setPagina(int valor){
    if(valor == page) return;
    page =valor;
    _pageController.jumpToPage(valor);
  }

}