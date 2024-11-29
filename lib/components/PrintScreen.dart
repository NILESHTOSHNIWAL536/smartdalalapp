import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';
// import 'package:pdf/pdf.dart';
import 'Data.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;

class PrintScreen extends StatefulWidget {
  const PrintScreen({ Key? key }) : super(key: key);

  @override
  _PrintScreenState createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final pdf = pw.Document();
  var Dates=StringData.DateObj;
  var party=StringData.PartyName;
  var place=StringData.District;
  var phone=StringData.phoneno;
  var riceName=StringData.RiceName;
  var no=StringData.sno;
  var RiceMillName=StringData.RiceMillName;
  var Bags=StringData.Bags;
  var kgs=StringData.Kgs;
  var rate=StringData.Rate;
  var transport=StringData.TransPort;
  var LorryNo=StringData.LorryNo;
  var Rs=StringData.Kiraya;
  var advance=StringData.Advance;
  var dis=StringData.Discount;
  bool Flag=true;
  // var balance="";
  // var Qnt="";
    var Qnt=((double.parse(StringData.Bags==""?'0':StringData.Bags)*double.parse(StringData.Kgs==""?'0':StringData.Kgs))/100).toString();
    var balance=(int.parse(StringData.Kiraya==""?'0':StringData.Kiraya)-int.parse(StringData.Advance==""?'0':StringData.Advance)).toString();
  // var word=NumberToWordsEnglish.convert(int.parse(balance));


  Widget SizedBoxH(){
    return SizedBox(height: 8,);
  }


  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
       child: Container(
         child:  Container(
          decoration: BoxDecoration(
                   color: Colors.white,
                      border: Border.all(
                         color: Colors.black,
                         width: 2,
                        
                      )
                   ),
           child: Screenshot(
            controller: screenshotController,
             child: Column(
               children: [
                 Card(
                   elevation: 2,
                   child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                         decoration: BoxDecoration(
                         color: Colors.white,
                            border: Border.all(
                               color: Colors.black,
                               width: 2,
                            )
                         ),
                          child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                       SizedBox(height:25),
                                      
                                       Top(),
                
                                       Header(),
                
                                       Flag?CellNo2():CellNo(),
                                      
                                       Divider(
                                        color: Colors.black,
                                        thickness:2,
                                       ),
                                       SizedBox(height: 3,),
                                       Padding(
                                         padding: const EdgeInsets.symmetric(horizontal:9.0),
                                         child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                RichTextD("S.No : ",no),
                                                RichTextD("Date :" ,Dates),
                                            ],
                                         ),
                                       ),
                                        SizedBoxH(),
                                        Row(
                                           mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [ 
                                              Icon(Icons.phone_callback,size: 15,),
                                              TextStyleD(" "+phone,Color.fromARGB(255, 225, 79, 0), 13.0)
                                           ],
                                        ),
                                        SizedBoxH(),
                                       Padding(
                                         padding: const EdgeInsets.symmetric(horizontal:9.0),
                                         child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                                 TextStyleD("M/S . ", Colors.black, 14.0),
                                                 SizedBox(width: 3,),
                                                          Container(
                                                              color: Colors.cyan,
                                                              child: Center(child: Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                                                                child: TextStyleD(party.toUpperCase(), Colors.white, 13.0),
                                                              ))
                                                              ),
                                                SizedBox(width: 5,),
                                                 TextStyleD(place.toUpperCase(), Colors.black, 12.0),
                                            ],
                                         ),
                                       ),
                                   SizedBoxH(),
                                   SizedBox(height: 2,),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          
                                                 TextStyleD("Today we are despatching Rice/Borken Rice  ", Colors.black, 9.0),
                                                 TextStyleD(riceName.toUpperCase(), Color.fromARGB(255, 242, 44, 156), 13.0),
                                                //  RichTextD(" ",riceName.toUpperCase()),
                                                //  SizedBox(width: 10,),
                                        ],
                                    ),
                                    SizedBoxH(),
                                    SizedBox(height: 2,),
                                    Row(
                                        children: [
                                                  Expanded(child:   RichTextD("Bags : ",Bags),),
                                                  Expanded(child:   RichTextD("Kgs : ",kgs),), 
                                                  Expanded(child:   RichTextD("Qnt : ",Qnt+"Q"),),
                                                  Expanded(child:   RichTextD("Rate : ",rate),),
                                        ],
                                    ),
                                     SizedBoxH(),
                                     SizedBox(height: 4,),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                                  TextStyleD("of m/s.", Colors.black, 14.0),
                                                  SizedBox(width: 4,),
                                                  Center(
                                                    child: Column(
                                                       mainAxisAlignment: MainAxisAlignment.center,
                                                       crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                             Container(
                                                              color: Colors.cyan,
                                                              // width: 250,
                                                              child: Center(child: Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 2),
                                                                child: TextStyleD(RiceMillName.toUpperCase(), Colors.white, 16.0),
                                                              ))
                                                              ),
                                                             
                                                        ],
                                                    ),
                                                  )
                                                 
                                        ],
                                    ),
                                    SizedBoxH(),
                                    SizedBox(height: 2,),
                                    Row(
                                        children: [
                                                Expanded(child: TextStyleD("TransPort :", Colors.black, 13.5)),
                                                Expanded(child: TextColorD(transport, Colors.red, 14.0)),
                                                Expanded(child: TextStyleD("LorryNo :", Colors.black, 13.5)),
                                                Expanded(child: TextColorD(LorryNo, Colors.red, 12.0))
                                        ],
                                    ),
                                   SizedBoxH(),
                                    Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                           Expanded(flex: 3,child: TextStyleD("Please Pay lorry Freight", Colors.black, 14.0)),
                                          //  Text("----------------"),
                                           Expanded(flex:1,child: TextStyleD("Rs : ", Colors.black, 12.0)),
                                           Expanded(flex:1,child: TextColorD(Rs, Colors.red, 12.0)),
                                       ],
                                    ),
                                     SizedBoxH(),
                                    Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                           Expanded(flex: 3,child: TextStyleD("Less:Lorry Advance Paid", Colors.black, 14.0)),
                                          //  Text("----------------"),
                                           Expanded(flex:1,child: TextStyleD("Rs : ", Colors.black, 12.0)),
                                           Expanded(flex:1,child: TextColorD(advance, Colors.red, 12.0)),
                                       ],
                                    ),
                                    SizedBoxH(),
                                    Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                           Expanded(flex: 1,child: TextStyleD("Balace To pay", Colors.black, 14.0)),
                                          //  Text("----------------"),
                                           Expanded(flex:1,child: Padding(
                                             padding: const EdgeInsets.only(left:18.0),
                                             child: TextStyleD("Rs : ", Colors.black, 12.0),
                                           )),
                                           Expanded(flex:1,child: TextColorD(balance, Colors.red, 12.0)),
                                       ],
                                    ),
                                   SizedBoxH(),
                                    Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                          Expanded(flex:1,child: TextStyleD("in words Rs.", Colors.black, 14.0)),
                                          Expanded(flex:2,child: TextColorD(NumberToWordsEnglish.convert(int.parse(balance)).toUpperCase(), Colors.red, 10.0))
                                       ],
                                    ),
                                    SizedBoxH(),
                                    Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         TextStyleD("Please Send the Draft @ ", Colors.black, 10.0),
                                         TextStyleD(dis+"%", Colors.redAccent, 15.0),
                                         TextStyleD("Cash Discount with 2/5 Days", Colors.black, 10.0),
                
                                       ],
                                    ),
                                   SizedBoxH(),
                                   SizedBox(height: 2,),
                                    Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Expanded(flex:1,child: TextStyleD("OF BANK", Colors.black, 12.0)),
                                         Expanded(
                                            flex: 1,
                                           child: Container(
                                               width: 30,
                                               child: Column(
                                                 children: [
                                                    SizedBox(height: 12,),
                                                   Divider(color: Colors.red,thickness: 2,),
                                                 ],
                                               ),
                                           ),
                                         ),
                                         Expanded(child: TextStyleD("BRANCH", Colors.black, 12.0)),
                                         Expanded(
                                           child: Container(
                                               width: 30,
                                               child: Column(
                                                 children: [
                                                   SizedBox(height: 12,),
                                                   Divider(color: Colors.red,thickness: 2,),
                                                 ],
                                               ),
                                           ),
                                         ),
                
                                       ],
                                    ),
                                    SizedBoxH(),
                                    Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                        
                                         Expanded(child: TextStyleD("At our address only", Colors.black, 14.0)),
                                         Expanded(child: Container(color: Colors.redAccent,child: Center(child: TextStyleD("Along with 'c' form", Colors.white, 14.0)))),
                                        
                
                                       ],
                                    ),
                                    SizedBox(height: 30,),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Column(
                                              children: [
                                                     TextStyleD("Bill No .", Colors.black, 14.0),
                                                    TextStyleD("Bill Amount Rs.", Colors.black, 14.0),
                                                    TextStyleD("Through :", Colors.black, 14.0)
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                           TextStyleD(Flag?"NIKHIL TOSHNIWAL":"BALAJI TOSHNIWAL", Colors.redAccent, 14.0),
                                                           TextStyleD("Your's Faithfully", Colors.black, 14.0)
                                              ],
                                            ),
                                        ],
                                    )
                  
                               ],
                          ),
                    ),
                 ),
                //  Row(
                //     children: [
                //            Expanded(
                //                             flex: 1,
                //                             child: Card(
                //                               elevation: 2,
                //                               child: Container(
                                                
                //                                 padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                //                                  decoration: BoxDecoration(
                //                                   color: Flag?Colors.red:Colors.white,
                //                                    borderRadius: BorderRadius.circular(12),
                //                                   border: Border.all(color: Colors.black,width: 3)
                //                                 ),
                //                                 child: InkWell(
                //                                   onTap: () {
                //                                       sharefile();
                //                                   },
                //                                   child: Text("Share",style: TextStyle(
                //                                       fontSize: 20,
                                                      
                //                                       color: Colors.black
                //                                   ),
                //                                     textAlign: TextAlign.center,
                //                                   ),
                //                                  ),
                //                               ),
                //                             ),
                //                 ),
                //     ],
                //  ),
                
              
       
                  Row(
                      children: [
                             Expanded(
                                            flex: 1,
                                            child: Card(
                                              elevation: 2,
                                              child: Container(
                                                
                                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                                 decoration: BoxDecoration(
                                                  color: Flag?Colors.red:Colors.white,
                                                   borderRadius: BorderRadius.circular(12),
                                                  border: Border.all(color: Colors.black,width: 3)
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                     setState(() {
                                                         Flag=true;
                                                     });
                                                  },
                                                  child: Text("Nikhil",style: TextStyle(
                                                      fontSize: 20,
                                                      
                                                      color: Colors.black
                                                  ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                 ),
                                              ),
                                            ),
                                ),
                             Expanded(
                                            flex: 1,
                                            child: Card(
                                              elevation: 2,
                                              child: Container(
                                                
                                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                                 decoration: BoxDecoration(
                                                  color:   !Flag?Colors.red:Colors.white,
                                                   borderRadius: BorderRadius.circular(12),
                                                  border: Border.all(color: Colors.black,width: 3)
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                     setState(() {
                                                         Flag=false;
                                                     });
                                                  },
                                                  child: Text("Balaji",style: TextStyle(
                                                      fontSize: 20,
                                                      
                                                       color:Colors.black,
                                                  ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                 ),
                                              ),
                                            ),
                                )
                      ],
                  )
               ],
             ),
           ),
         ),
       ),
     );
  }




 


  Widget RichTextWithTwoDivider(text1,text2){
        return Expanded(
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                         TextStyleD(text1,Colors.black,12.0),
                         Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                                  TextStyleD(text2,Colors.red,13.0),
                                    Container(
                                      width: 20,
                                      child: Divider(
                                           color: Colors.black,
                                           thickness:1,
                                        
                                         ),
                                    )
                             ],
                         )
                  ],
             ),
        );

  }

  Widget TextColorD(text,color,size){
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Text(text,style: TextStyle(
                                    fontSize: size,
                                    color:color,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  
                                 ),
                                
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            )
        ],
      ),
    );
  }


  Widget TextDivider(text1,text2){
      return Expanded(child:Column(
        
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                       Padding(
                                         padding: const EdgeInsets.all(0.0),
                                         child: RichTextD(text1,text2),
                                       ),
                    
                                       Padding(
                                         padding: const EdgeInsets.all(0.0),
                                         child: Divider(
                                           color: Colors.black,
                                           thickness:1,
                                         ),
                                       )
              ],));
  }


  Widget TextStyleD(text,color,size){
      return  Text(text,style: TextStyle(
                              fontSize: size,
                              color:color,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            
                           ),
                          
                );
  }













  Widget RichTextD(text1,text2)
  {
      return RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children:<TextSpan>[
                    TextSpan(text: text1, style:TextStyle(
                              fontSize: 12,
                              color:Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            
                           )),
                    TextSpan(text: text2,style:TextStyle(
                              fontSize: 12,
                              color:Colors.red,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            
                           )),
                  ],
                ),
              );
                    
  }

  Widget Top(){
   return   Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                   Align(
                                    alignment: Alignment.center,
                                    child: TextStyleD("श्री",Colors.red,15.0)),
                              ],   
                           );

  }

  Widget CellNo(){
    return  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                      TextStyleD("Cell : 98493 34342", Colors.black, 12.0),  
                                      TextStyleD("83749 64342", Colors.black, 12.0),
                               ],
                  );
  }

  Widget CellNo2(){
    return  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                      TextStyleD("Cell : 94926 94841", Colors.black, 12.0),  
                                      TextStyleD("63058 20767", Colors.black, 12.0),
                               ],
                  );
  }

  Widget Header(){
       return  Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                     Image.asset("assets/images/balaji.png",width: 55,height: 55,),
                     SizedBox(width: 5,),
                     Column(
                      children:[
                          TextStyleD(Flag?"TOSHNIWAL CORPORATIONS":"BALAJI VASAVI CORPORATIONS",Colors.red,15.0),
                          TextStyleD("rice & broken rice canvassing agent",Colors.black,13.0),
                          SizedBox(height: 5,),
                          TextStyleD("D.No 7-2-47 , Goushala Bhavan,Near railway Gate,",Colors.black,10.0),
                          SizedBox(height: 5,),
                          TextStyleD("NIZAMABAD - 503001 (T.S)",Colors.black,10.0),
                       
                      ]
                     ),
                ],
       );
  }


}