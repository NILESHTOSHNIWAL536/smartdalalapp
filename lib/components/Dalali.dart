import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:smartdalala/components/add.dart';

class Dalali extends StatefulWidget {
  const Dalali({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Dalali> {

  final name= TextEditingController();
  final amount= TextEditingController();
  final date= TextEditingController(text:DateFormat('d/MM/yyyy').format(DateTime.now()).toString() );

  final transport= TextEditingController();
  final contactno= TextEditingController();





 Widget InputDate(lableText,keyBoard,Textcontroller,icons){

    return Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width/1.1,
          child: TextFormField(
               keyboardType: keyBoard,
                controller: date,
              decoration: InputDecoration(
                labelText: lableText,
                border: OutlineInputBorder(),
                suffixIcon:IconButton( onPressed: ()async{
                      DateTime? dateTime=await showDatePicker(context: context, initialDate: DateTime.now(),
                       firstDate: DateTime(2021), lastDate: DateTime(2025));
                       setState(() {
                           if(dateTime!=null){
                               String str=new DateFormat("dd/MM/yyyy").format(dateTime);
                               date.text=str;
                           }

                       });
                },icon:Icon( Icons.date_range_outlined)),
              ),
            ),
        ),
      );


  }


  void addDalal()async{
         print("Daallaklmkl");
         print({
           'name':name.text,
           'tarik':date.text.toString(),
           'amount':amount.text,
           'transport':transport.text,
           'contactno':contactno.text
       });
            final SharedPreferences Detailsuser = await SharedPreferences.getInstance();
          final String id = Detailsuser.getString('id').toString();
          //  var url='${path}/admin/display/'+userid;
     final response = await http.post(
    Uri.parse('${path}/payment/'+userid),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
           'name':name.text,
           'Dateobj':date.text.toString(),
           'amount':amount.text,
       }),
    
     
  );

       if (response.statusCode == 200) {
            Navigator.pushNamed(context, "/Menu");
       }

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
       drawer: Drawer(),
      appBar: AppBar(
               backgroundColor: Colors.red,
               title:const Center(child: Text("Smart Dalal",style: TextStyle(
                     color: Colors.black,
                     fontSize: 25,
                     fontWeight: FontWeight.bold
               ),)),
          ),
      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Center(
            child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                         const  SizedBox(height: 40,),
                          InputDate("Date",TextInputType.name,date,Icons.date_range),
                          Input("Name",TextInputType.name,name,Icons.near_me),
                          Input("Amount",TextInputType.number,amount,Icons.move_up),
                          // Input("Transport",TextInputType.name,transport,Icons.tab_outlined),
                          // Input("ConatctNo",TextInputType.number,contactno,Icons.accessibility_rounded),
                          const SizedBox(height: 50,),
                          InkWell(
                            onTap: (){
                             
                                addDalal();
                            },
                             child: Container(
                               padding:const EdgeInsets.symmetric(vertical: 5),
                               width: MediaQuery.of(context).size.width/1.1,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)
                                     
                                ),
                                 child: const Text("Add Dalali",style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
               
                                                ),
                                                textAlign: TextAlign.center,
                                     ),
                             ),
                          ),
                          const SizedBox(height: 18,),
                          
                          
                  ]),
             ),
          ),
        ),
      ),
    );
  }


   Widget Input(lableText,keyBoard,Textcontroller,icons){
      // print(Textcontroller);
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width/1.1,
          child: TextFormField(
               keyboardType: keyBoard,
                controller: Textcontroller,
              decoration: InputDecoration(
                labelText: lableText,

                border: OutlineInputBorder(),
                
                suffixIcon: Icon(icons),
              ),
            ),
        ),
      );
   }

  


}