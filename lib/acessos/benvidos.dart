import 'package:app_barbearia/acessos/CadastroSalao.dart';
import 'package:app_barbearia/acessos/agendarAtendimento.dart';
import 'package:flutter/material.dart';

class benvindo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Color(0xFFF58524),
       title: Text("Bem Vindo",
       textAlign: TextAlign.center,),
     ),
     
     body: Container(
       padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
       child: ListView(
         children: <Widget>[
           SizedBox(height: 50),

           Text("Bem Vindo ao HAIR STYLIST Somo um rede de agendamento de Corte de cabelo, Unha, sombramselha,"+
           "Depilação e outro agende agora no seu sação de preferencia informe Cadastra Salão ou Agendar atendimento",
           style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
              color: Color(0xFF3C5A99),
              borderRadius: BorderRadius.all(Radius.circular(5))                                 
              ),
              child:SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    children: <Widget>[
                      Text("Cadastra Salao",
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
            ),SizedBox(height: 20,),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
              color: Color(0xFF3C5A99),
              borderRadius: BorderRadius.all(Radius.circular(5))                                 
              ),
              child:SizedBox.expand(
                child: FlatButton(
                  onPressed: () => { 
                  Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)=> agendarAtendimento(),
                    )
                  )
                  },
                  child: Row(
                    children: <Widget>[
                      Text("Agendar Atendimento",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                  
                  ),
                  )
                ],               
              ),
              
              ),
            ),
            ),
       
       ],
       
       ),
       
       ),
        
          
    );
  }
}