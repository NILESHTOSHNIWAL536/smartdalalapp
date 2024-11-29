import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartdalala/components/add.dart';
import 'package:smartdalala/components/menu.dart';
import 'package:smartdalala/components/table.dart';

import 'model.dart';


class RiceMill extends StatefulWidget {
  const RiceMill({ Key? key }) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<RiceMill> {

 late Autogenerated data;
 bool flag=true;
  bool paid=false;
 TextEditingController RiceMill=new TextEditingController();
 late Autogenerated datatemp;


  void getdata()async{
          final SharedPreferences Detailsuser = await SharedPreferences.getInstance();
          final String id = Detailsuser.getString('id').toString();
           var url='${path}/admin/display/'+userid;
          // var url='https://corporations-production.up.railway.app/admin/display/'+id;
          final response = await http.get(Uri.parse(url));
          if (response.statusCode == 200) {
              setState(() {
               data = Autogenerated.fromJson(jsonDecode(response.body));
               flag=false;
                datatemp=Autogenerated.fromJson(jsonDecode(response.body));
              });
             
          } else {
            throw Exception('Failed to load album');
          }
  }

 @override
  void initState() {
    getsearchDataoriginalData();
    super.initState();
  }


  Future<void> _showAlertDialog( List<Bill>? bill) async {
 
  if(bill==null)return;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog( // <-- SEE HERE
        title: const Text('Order Details'),
        content: SingleChildScrollView(
          child: Column(
            children:  <Widget>[
                  
                
              
                   SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                     child:SingleChildScrollView(
                        child:  DataTable(
                  columns:const [
                    // DataColumn(label: Text('Sno'),),
                    DataColumn(label: Text('Rice Name'),),
                    DataColumn(label: Text('Bags'),),
                    DataColumn(label: Text('Kgs'),),
                    DataColumn(label: Text('Rate'),),
                
                  ],
                  rows: 
                        bill.map((item) =>
                          // we return a DataRow every time
                          DataRow(
                              // List<DataCell> cells is required in every row
                              cells: [
                             
                                DataCell(Text(item.rice.toString())),
                                DataCell(Text(item.bags.toString())),
                                DataCell(Text(item.kg.toString())),
                                DataCell(Text(item.rate.toString())),
                                
                              
                              ]))
                      .toList(),
                ),
                     ),
                 ),
           
           ]  ), 
         ),
          

          
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void onchangeDate(){
     
      List<Items> list=[];
      list=originalData.items!.where((item) =>item.ricemill.toString().toLowerCase().contains(RiceMill.text.toLowerCase()) && item.paid == paid).toList();
      searchData.items=list;
      f.value=!f.value;
      
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
               onChanged: (value) {
                   onchangeDate();
               }, 
              decoration: InputDecoration(
                labelText: lableText,

                border: OutlineInputBorder(),
                
                suffixIcon: Icon(icons),
              ),
            ),
        ),
      );
   }

  

  @override
  Widget build(BuildContext context)
 {
    return Scaffold(
      appBar: AppBar(
               backgroundColor: Colors.orange,
                leading: getBack(context),
               title:const Center(child: Text("Display",style: TextStyle(
                     color: Colors.black,
                     fontSize: 25,
                     fontWeight: FontWeight.bold
               ),)),
      ),
      // floatingActionButton: floatingButton(data,context,RiceMill.text),
      body:  Container(
                 child:SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                     child:SingleChildScrollView(
                        child:  Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:18.0),
                            child: Input("RiceMillName",TextInputType.name,RiceMill,Icons.near_me),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Text( paid ? "Paid"  : "UnPaid"),
                              const SizedBox(width: 20,),
                              Checkbox(value: paid, onChanged: (e){
                                    setState(() {
                                       paid=e!;
                                    });
                                     onchangeDate();
                              }),
                            ],
                          )

                        ],
                      ),

                      
               
                            SizedBox(height: 30,),
                           TableDisplay(data: searchData,title: ""),
                          ],
                        ),
                     ),
                 ),
             ),
    );
  }
}
