import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:app_barbearia/modelos/urser.dart';
import 'package:flutter/material.dart';
import 'package:app_barbearia/data/dammy_users.dart';
import 'package:flutter/cupertino.dart';


class Users with ChangeNotifier {
  //final FirebaseAuth auth = FirebaseAuth.instance;
  static const _baseUrl= 'https://hair-stylist-2d2a1/Usuario';
  final Map<String, User> _items = {...DUMMY_USERS};
  //get email => this.email;
  get senha => this.senha;

  List<User> get all{
    
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }
  


  User byIndex(int i){
    return _items.values.elementAt(i);
  }


  //altera e cria novo usuario
  Future<void> put(User user) async {

    if (user == null){
      return;
    }
    
    if(user.id != null && user.id.trim().
    isNotEmpty && _items.containsKey(user.id)){
        http.delete(
        '$_baseUrl/users/${user.id}.json');

          await http.patch(
          '$_baseUrl/users/${user.id} .json',
          body: json.encode({
            'name': user.name,
            'email': user.email,
            'senha': user.senha,
            'celular': user.celular,
            'cpf': user.cpf,
            'avatarUrl': user.avatarUrl
          }),
        );

        _items.update(user.id, (value) => User(
        id: user.id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl,
        celular: user.celular,
        cpf: user.cpf,
        senha: user.senha,
        ),);
      }else{
        final respose = await http.post(
          '$_baseUrl/users.json',
          body: json.encode({
            'name': user.name,
            'email': user.email,
            'senha': user.senha,
            'celular': user.celular,
            'cpf': user.cpf,
            'avatarUrl': user.avatarUrl
          },
        ),
      );

      final id =json.decode(respose.body)['name'];
      print(json.decode(respose.body));
      _items.putIfAbsent(id, () => User(
          id: id,
        name: user.name,
        email: user.email,
        cpf: user.cpf,
        celular: user.celular,
        senha: user.senha,
        ),
      );
      }
      
      notifyListeners();
    }

  void remove(User user){
    if(user != null && user.id != null){
      http.delete(
        '$_baseUrl/users/${user.id}.json',
      );
      _items.remove(user.id);
      notifyListeners();
    }

   
  }

  
}



