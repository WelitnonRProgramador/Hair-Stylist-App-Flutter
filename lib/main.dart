import 'package:app_barbearia/modelos/GerenciamentoUsuario.dart';
import 'package:app_barbearia/modelos/urser.dart';
import 'package:app_barbearia/provider/users.dart';
import 'package:app_barbearia/routes/app_routes.dart';
import 'package:app_barbearia/views/FormularioUsuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Loding/Login.dart';
import 'package:firebase_core/firebase_core.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
 
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MultiProvider(providers: [
      ChangeNotifierProvider(
      create:(ctx) => Users(),

      )
    ],
      child: MaterialApp(
  
            title: 'hair stylist',
  
            debugShowCheckedModeBanner: false,
  
            theme: ThemeData(
  
              primarySwatch: Colors.deepOrange,
  
              visualDensity: VisualDensity.adaptivePlatformDensity,
  
              scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  
            ),
  
            
  
            routes: {
  
              AppRoutes.HOME: (_) => Login(),
  
              AppRoutes.USER_FORM: (_) => FormularioUsuario(),
  
            },
  
          ),

    );
  }
}



