import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smartdalala/components/add.dart';


class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final email= TextEditingController();
  final password= TextEditingController();
  final adminName= TextEditingController();
  final shopName= TextEditingController();
  final shopAddress= TextEditingController();
  final contactNo= TextEditingController();


  void registeruser()async{

    //  Navigator.pushNamed(context, '/',);  
      print("rice ");
     final response = await http.post(
    Uri.parse('${path}/admin'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
        'shop_name':shopName.text,
        'shop_address':shopAddress.text,
        'admin_name':adminName.text,
        'contactNo1':contactNo.text,
        'emailadress':email.text,
        'password':password.text,
       }),
  );
  print(response);
  }

  // print(responce);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       drawer: Drawer(),
      appBar: AppBar(
               backgroundColor: Colors.orange,
               title:const Center(child: Text("Smart Dalal",style: TextStyle(
                     color: Colors.black,
                     fontSize: 25,
                     fontWeight: FontWeight.bold
               ),)),
          ),
      body: SafeArea(
        
        child: Expanded(
          child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                
                          Input("Name",TextInputType.name,adminName,Icons.email_outlined),
                          Input("Contact No",TextInputType.phone,contactNo,Icons.remove_red_eye),
                          Input("Shop Name",TextInputType.name,shopName,Icons.email_outlined),
                          Input("Shop Address",TextInputType.name,shopAddress,Icons.email_outlined),
                          Input("Email Address",TextInputType.name,email,Icons.email_outlined),
                          Input("Password",TextInputType.name,password,Icons.remove_red_eye),
                
                          const SizedBox(height: 50,),
                          InkWell(
                            onTap: (){
                                registeruser();
                            },
                             child: Container(
                               padding:const EdgeInsets.symmetric(vertical: 5),
                               width: MediaQuery.of(context).size.width/1.1,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)
                                     
                                ),
                                 child: const Text("Sign Up",style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold
                           
                                                ),
                                                textAlign: TextAlign.center,
                                     ),
                             ),
                          ),
                          const SizedBox(height: 18,),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                                const Text("Already Have an Account ?   ",style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold
                           
                                                ),
                                                textAlign: TextAlign.center,
                                     ),
                               
                                 InkWell(
                                   onTap: (){
                                      registeruser();
                                    
                                   },
                                   child:const Text("Sign In",style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.orange,
                                                      fontWeight: FontWeight.bold
                                            
                                                  ),
                                                  textAlign: TextAlign.center,
                                       ),
                                 ),
                             ],
                          )  
                          
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