import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartdalala/components/add.dart';
import 'package:smartdalala/components/menu.dart';

import 'model.dart';


class Delete extends StatefulWidget {
  const Delete({ Key? key }) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Delete> {

 late Autogenerated data;
 bool flag=true;

  void getdata()async{
          final SharedPreferences Detailsuser = await SharedPreferences.getInstance();
          final String id = Detailsuser.getString('id').toString();
        
          var url='${path}/admin/display/'+userid;
          final response = await http.get(Uri.parse(url));
          if (response.statusCode == 200) {
              setState(() {
               data = Autogenerated.fromJson(jsonDecode(response.body));
               flag=false;
              });
               print(response.body);
              Items obj=data.items![0];
              print(obj.lorry);
          } else {
            throw Exception('Failed to load album');
          }
  }

 @override
  void initState() {
    getdata();
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


  void deletedata(itId)async{
    //  /admin/:userid/:itemid
    final SharedPreferences Detailsuser = await SharedPreferences.getInstance();
          final String id = Detailsuser.getString('id').toString();
    // var url='https://corporations-production.up.railway.app/admin/'+id+"/"+itId;
      var url='${path}/admin/'+userid+"/"+itId;
     final http.Response response = await http.delete(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
      );
      setState(() {
        
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => super.widget));

    // print(itId);

  }


  @override
  Widget build(BuildContext context) {
   


    return Scaffold(
      appBar: AppBar(
               backgroundColor: Colors.orange,
                leading: getBack(context),
               title:const Center(child: Text("Delete",style: TextStyle(
                     color: Colors.black,
                     fontSize: 25,
                     fontWeight: FontWeight.bold
               ),)),
      ),
      body: Container(
                 child: flag? Text("Loading..."):SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                     child:SingleChildScrollView(
                        child:  DataTable(
                  columns:const [
                    // DataColumn(label: Text('Sno'),),
                    DataColumn(label: Text('Delete'),),
                    DataColumn(label: Text('Date'),),
                    DataColumn(label: Text('Ricemill Name'),),
                    DataColumn(label: Text('Party Name'),),
                    DataColumn(label: Text('Place'),),
                    DataColumn(label: Text('Lorry No'),),
                    DataColumn(label: Text('Order Details'),),
                  ],
                  rows: 
                     data.items!.map((item) =>
                          // we return a DataRow every time
                          DataRow(
                              // List<DataCell> cells is required in every row
                              cells: [
                              //  DataCell(Text(item.dateobj.toString())),
                              DataCell(
                                 InkWell(
                                     onTap: (){
                                        deletedata(item.sId);
                                     },
                                     child:const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ) ,
                                ),
                              ),
                             
                                DataCell(Text(item.dateobj.toString())),
                                DataCell(Text(item.ricemill.toString())),
                                DataCell(Text(item.party.toString())),
                                DataCell(Text(item.district.toString())),
                                DataCell(Text(item.lorry.toString())),
                                DataCell(InkWell(
                                  onTap: (){
                                       _showAlertDialog(item.bill);
                                      // Bill? bill=item.bill;
                                      // print(bill!.rice);
                                  },
                                  child: Icon(Icons.arrow_forward_ios,color: Colors.green,))
                                 ),
                              ]))
                      .toList(),
                ),
                     ),
                 ),
             ),
    );
  }
}
