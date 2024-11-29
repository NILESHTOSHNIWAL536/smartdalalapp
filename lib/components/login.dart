import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:smartdalala/components/userdata.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

 final email= TextEditingController(text: 'nikhil@gmail.com');
  final password= TextEditingController(text: '1234');
  late final SharedPreferences prefs;
  bool log=false;

 @override
  void initState() {
    // TODO: implement initState
    log=false;
    super.initState();
  }
  

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
        
        child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      Input("Email Address",TextInputType.name,email,Icons.email_outlined),
                      Input("Password",TextInputType.name,password,Icons.remove_red_eye),
                      const SizedBox(height: 50,),
                      InkWell(
                        onTap: (){

                          setState(() {
                              log=true;
                          });

                          loginuser();
                            
                        },
                         child: Container(
                           padding:const EdgeInsets.symmetric(vertical: 5),
                           width: MediaQuery.of(context).size.width/1.1,
                            decoration: BoxDecoration(
                                color: !log? Colors.orange:Colors.black,
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10)
                                 
                            ),
                             child:  Text(!log? "Sign In":"Loading...",style:const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
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
                            const Text("Don't Have Account ?   ",style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
           
                                            ),
                                            textAlign: TextAlign.center,
                                 ),
                           
                             InkWell(
                               onTap: (){
                                   Navigator.pushNamed(context, '/signup',);  
                               },
                               child:const Text("Sign Up",style: TextStyle(
                                                  fontSize: 13,
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

   

  void loginuser()async
  {
      Navigator.pushNamed(context, '/Menu');  
  //         var url='http://localhost:6000/admin/'+email.text.toString()+"/"+password.text.toString();
  //         print(url);
  //          try{
  //             final response = await http.get(Uri.parse(url));
  //               print(response);
  //             if(response.statusCode==200){
  //               print(response);
  //               var userdata=userDetails.fromJson(jsonDecode(response.body));
  //               String? s=userdata.sId;
  //               final SharedPreferences Detailsuser = await SharedPreferences.getInstance();
  //                await Detailsuser.setString('id', s.toString());
  //                Navigator.pushNamed(context, '/Menu');  
                 
  //             }
  //          }catch(e){
  //                         const  AlertDialog(
  //                   title:  Text('Invalid userid and password'),
  //                   content:  SingleChildScrollView(
  //                     child: ListBody(
  //                       children: <Widget>[
  //                         Text('This is a demo alert dialog.'),
  //                         Text('Would you like to approve of this message?'),
  //                       ],
  //                     ),
  //                   ));
  //          }
  }


}