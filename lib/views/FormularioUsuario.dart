import 'package:app_barbearia/ajudas/validacao.dart';
import 'package:app_barbearia/modelos/urser.dart';
import 'package:app_barbearia/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class FormularioUsuario extends StatefulWidget {

  @override
  _FormularioUsuarioState createState() => _FormularioUsuarioState();
}

class _FormularioUsuarioState extends State<FormularioUsuario> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  bool caregamento = false;

  void _caregarFormulario(User user){
    if(user != null){
      _formData['id'] = user.id;
      _formData['nome'] = user.name;
      _formData['Email'] = user.email;
      _formData['Senha'] = user.senha;
    }
  }

  @override
  Widget build(BuildContext context) {

    final User user = ModalRoute.of(context).settings.arguments;
    _caregarFormulario(user);

    return Scaffold(
      appBar: AppBar(title: Text("Formulario de Funcionario"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save), 
          onPressed: () async {
            final isValido = _form.currentState.validate();

            if(isValido){
            _form.currentState.save();
            await Provider.of<Users>(context, listen: false).put(User(
              id: _formData['id'],
              name: _formData['nome'],
              email: _formData['Email'],
              senha: _formData['Senha'],
      
                    ));
            Navigator.of(context).pop();
                    }
          }
          )
      ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),


              TextFormField(
                validator: (value){
              if(value == null || value.isEmpty){
                return "Campo Obrigatorio";
              }else if (value.trim().length<3){
                return "nome Invalido";
              }else return null;
            },
                initialValue: _formData['nome'],
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "nome",),
                  onSaved: (value) => _formData["nome"] = value, 
              ),


              SizedBox(height: 20,),
              TextFormField(
                validator: (value){
                if(!emailValid(value)){
                  return "Email invalido";
                }else return null;
                },
                initialValue: _formData['Email'],
                autocorrect: false,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(  
                  labelText: "Email",),
                  onSaved: (value) => _formData["Email"] = value, 
              ),


              SizedBox(height: 20,),
              TextFormField(
               validator: (senha){
                if (senha.trim().length<5){
                  return 'Minimo de 6 caracter';
                }else return null;
              },
              initialValue: _formData['Senha'],
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",),
                  onSaved: (value) => _formData["Senha"] = value, 
              )


            ],
          )
          ),
      ), 
    );
  }
}