import 'package:flutter/material.dart';

class CadastroSalao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
       title: Text('Cadastro de Salão'),
      ),
      
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 40,
          right: 40),
        child: Form(
          child:Column(
            children: <Widget>[
          TextFormField(
           decoration: InputDecoration(
                labelText: "Nome Fantasia:",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20  
                ),                
                ), 
        ),

        SizedBox(height: 20,),
        TextFormField(
          decoration: InputDecoration(
            labelText: "CPF ou CNPJ",
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 20
            )
          ),
        ),

        SizedBox(height: 20,),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Telefone de Contato',
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 20
            )
          ),
        ),

        SizedBox(height: 20,),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Endereço',
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 20
            )
          ),
        ),

        SizedBox(height: 20,),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'CEP',
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 20
            )
          ),
        ),
        SizedBox(height: 100,),
         Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
              color: Color(0xFFF92B7F),
              borderRadius: BorderRadius.all(Radius.circular(5))                                 
              ),
         child: SizedBox.expand(
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                  Text("Salvar Cadastro",
                   style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                  
                  ),
                  )
                ],               
              ),
              onPressed: () => {
                Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)=> CadastroSalao(),
                    )
                  )
                  },
              ),
            ),
         )
            ]

          )         
      )
      ),
    );
  }
}