
import 'package:app_barbearia/acessos/benvidos.dart';
import 'package:app_barbearia/acessos/reseta-senha.dart';
import 'package:app_barbearia/ajudas/validacao.dart';
import 'package:app_barbearia/modelos/GerenciamentoUsuario.dart';
import 'package:app_barbearia/modelos/Usuario.dart';
import 'package:app_barbearia/views/user_list.dart';
import 'package:flutter/material.dart';
import '../acessos/Cadastro.dart';


class Login extends StatelessWidget {
  
 
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40,
          ),
          color: Colors.white,
          child: ListView(
            children: <Widget> [
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/cabelereiroUnixes.png"),
              ),
              SizedBox(
                height: 20,   
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20                  
                  )
                ),
                style: TextStyle(fontSize: 20),
                validator: (email){
                if(!emailValid(email))
                  return "E-mail invalido";
                return null;  
                }
              ),


              SizedBox(height: 20,),
              TextFormField(
                controller: senhaController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
                ), 
                validator: (senha){
                  if(senha.isEmpty || senha.length < 6)
                    return "senha Invalida";
                  return null;  
                }, 
                style: TextStyle(fontSize: 20),
              ),


              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: FlatButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> resetaSenha(),
                    ),
                  );
                }, 
                child: Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                )),
              ),


              SizedBox(height: 40,),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    stops: [0.3 , 1],
                    colors: [
                      Color(0xFFF58524),
                      Color(0xFFF92B7F)
                    ]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left, 
                        ),
                        Container(
                          child: SizedBox(
                            child: Image.asset("assets/Tesoura.png"),
                            height: 65,
                            width: 65,
                          ),
                        )
                      ],
                    ),
                    onPressed: () => {
                      if(formKey.currentState.validate()){
                        /*context.read<GerenciamentoUsuario>().signIn(
                            Usuario(
                              email: emailController.text,
                              senha: senhaController.text
                          )
                        ),*/

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> benvindo()
                          )
                        )
                        
                      }
                    }, 
                      
                    )
                ),
              ),


              SizedBox(height: 10,),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                color: Color(0xFF3C5A99),
                borderRadius: BorderRadius.all(Radius.circular(5))                                 
                ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Loging com Facebook",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/logoFace.png"),
                          height: 55,
                          width: 55,
                        ),
                      )
                    ],
                  ),
                  onPressed: () => {
                       
                  Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=> UserList(),
                      )
                    )
                    },
                  ),
              ),  
              ),


              SizedBox(height: 10,),
              Container(
                height: 40,
                child: FlatButton(onPressed: () => {
                  Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=> cadastro(),
                      )
                    )
                    }, 
                  child: Text("Cadastre-se",
                  textAlign: TextAlign.center,
                
                  )),
              )
            ],
          ),
        ),
      ),
    );
  }
}