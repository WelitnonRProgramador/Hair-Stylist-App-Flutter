import 'package:app_barbearia/ajudas/ErrosFirebase.dart';
import 'package:app_barbearia/modelos/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class GerenciamentoUsuario with ChangeNotifier{
  final FirebaseAuth auth = FirebaseAuth.instance;

  //GerenciamentoUsuario(TextEditingController emailController, TextEditingController senhaController);


  Future <void> signIn({Usuario usuario,Function onFail,Function onSuccess}) async {
    
    try{
        // ignore: unused_local_variable
        final UserCredential resultado  = await auth.signInWithEmailAndPassword(
          email: usuario.email,
          password: usuario.senha,

    );
        onSuccess();
    }on FirebaseAuthException catch (e){
        onFail(getErrosString(e.code));
    }
  }
}