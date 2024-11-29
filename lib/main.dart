import 'package:flutter/material.dart';
import 'package:smartdalala/components/Display.dart';
import 'package:smartdalala/components/PrintScreen.dart';
import 'package:smartdalala/components/paid.dart';
import 'package:smartdalala/components/unpaid.dart';

import 'components/Dalailist.dart';
import 'components/Dalali.dart';
import 'components/DueList_date.dart';
import 'components/Duelist.dart';
import 'components/Ricemillname.dart';
import 'components/add.dart';
import 'components/both.dart';
import 'components/deleteitems.dart';
import 'components/login.dart';
import 'components/menu.dart';
import 'components/party_due.dart';
import 'components/signup.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/Menu',  
      routes: {  
        '/': (context) => Login(),    
        '/signup': (context) => Signup(),    
        '/Menu': (context) => Menu(),    
        '/Add': (context) => Add(),    
        '/print': (context) => PrintScreen(),    
        '/DueList': (context) => DueList(),    
        // '/Display': (context) => Display(),    
        '/Delete': (context) => Delete(),    
        '/Dalali': (context) => Dalali(),    
        '/unPaid': (context) => Unpaid(),    
        '/Paid': (context) => Paid(),    
        '/Dalailist': (context) => Dalailist(),    
        '/DateList': (context) => DateList(),    
        '/RiceMill': (context) => RiceMill(),    
        '/PartyName': (context) => PartyName(),    
        '/Both': (context) => Both(),    
        
     },  
    );
  }
}

