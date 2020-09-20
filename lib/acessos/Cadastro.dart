import 'package:app_barbearia/ajudas/validacao.dart';
import 'package:app_barbearia/modelos/urser.dart';
import 'package:app_barbearia/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// ignore: camel_case_types
class cadastro extends StatelessWidget {

  final _formulario = GlobalKey<FormState>();
  final Map<String , String> _cadastro = {};

  @override
  Widget build(BuildContext context) {

  

    return Scaffold( 
     appBar: AppBar(
      title: Text("Cadastro"),
     ),

     body: Container(
       padding: EdgeInsets.only(
        top: 10,
        left: 40,
        right: 40),
        
        color: Colors.white,
        child:Form(
         key: _formulario,
          child: ListView(
        
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: Alignment(0.0, 1.15),
              decoration: new BoxDecoration(
                image: new DecorationImage(image: AssetImage("assets/imagecabelereiro.png"),
                fit: BoxFit.fitHeight,
                )
              ),
              child: Container(
                
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1.0],
                    colors: [
                    Color(0xFFF58524),
                    Color(0xFFF92B7F)
                    ],
                    ),
                  border: Border.all(
                  width: 4.0,
                  color: const Color(0xFFFFFFFF)
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(56)
                  ),   
                ),
                child: SizedBox.expand(
                  
                  child: FlatButton(
                
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  onPressed: () {},
                  ), 
                ),
              ),
            ),
          SizedBox(height: 20),


          TextFormField(
            // ignore: missing_return
            validator: (value){
              if(value == null || value.isEmpty){
                return "Campo Obrigatorio";
              }if (value.trim().length<3){
                return "nome Invalido";
              }
            },
            onSaved: (value) => _cadastro ['name'] = value,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                labelText: "Nome:",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20  
                ),                
                ),
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              SizedBox(height: 10),


            TextFormField(
                validator: (valor){
                  if(!emailValid(valor)) {
                    return "email invalido";
                  }
                  return null; 
                },
                
               onSaved: (valor) => _cadastro ['email'] = valor,
            
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                labelText: "Email:",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20  
                ),       
                         
              ),
              style: TextStyle(
                  fontSize: 20)
            ),
              SizedBox(height: 10),

            TextFormField(
              // ignore: missing_return
              validator: (senha){
                if (senha.trim().length<5){
                  return 'Minimo de 6 caracter';
                }
              },
              onSaved: (value) => _cadastro ['senha'] = value,
              keyboardType: TextInputType.multiline,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha:",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20  
                ),                
                ),
                style: TextStyle(
                  fontSize: 20)
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
                      Text("Cadastre-se",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
          
                      ),
                      textAlign: TextAlign.center,
                      
                      ),
                    
                    ],
                  ),
                  
                  onPressed: ()  { 
                    final isValido = _formulario.currentState.validate();

                    if(isValido){
                      _formulario.currentState.save();
                      Provider.of<Users>(context, listen: false).put(User(
                        id: _cadastro['id'],
                        name: _cadastro['name'],
                        email: _cadastro['email'],
                        senha: _cadastro['senha'],
                        ),
                        
                      );
                      Navigator.of(context).pop();
                      
                    }
                  }, 
                               
                  ),
              ),
            ),
          ]
        ),
        ) 
     )
   );
   
  }
}