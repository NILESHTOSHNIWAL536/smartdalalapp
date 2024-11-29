import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartdalala/components/add.dart';
import 'package:smartdalala/components/menu.dart';
import 'package:smartdalala/components/model.dart';
import 'package:smartdalala/components/pdf.dart';

import 'package:http/http.dart' as http;

class TableDisplay extends StatefulWidget {
  dynamic data;
  String title;
  TableDisplay({ Key? key,this.data,this.title=""}) : super(key: key);

  @override
  _TableState createState() => _TableState();
}


class _TableState extends State<TableDisplay> {

   TextEditingController DateObj=new TextEditingController(text:DateFormat('d/MM/yyyy').format(DateTime.now()).toString() );
    final RiceMillName=new TextEditingController();
    final PartyName=new TextEditingController();
    final District=new TextEditingController();
    final Sno=new TextEditingController(text: '1');
    final phoneno=new TextEditingController();
    final TransPort=new TextEditingController();
    final LorryNo=new TextEditingController();
    final Kiraya=new TextEditingController();
    final Advance=new TextEditingController();
    final Discount=new TextEditingController();
    int arrayIndex=0;

    final RiceName=new TextEditingController();
    final Kgs=new TextEditingController();
    final Bags=new TextEditingController();
    final Rate=new TextEditingController();

    final RiceName2=new TextEditingController();
    final Kgs2=new TextEditingController();
    final Bags2=new TextEditingController();
    final Rate2=new TextEditingController();

    final RiceName3=new TextEditingController();
    final Kgs3=new TextEditingController();
    final Bags3=new TextEditingController();
    final Rate3=new TextEditingController();

    List<TextEditingController> itemsController =[]; 
    RxBool paid=false.obs;
   


  @override
  Widget build(BuildContext context)
  {
    return Obx(() =>  f.value? getTable(): getTable());
  }



  Widget getTable(){
     return  Container(
      child: Container(
        width: MediaQuery.of(context).size.width*10,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 34.0),
                child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                           child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                               child:SingleChildScrollView(
                                  child:  Expanded(
                                    child: Center(
                                      child: DataTable(
                                        headingTextStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          
                                        ),
                                          showCheckboxColumn: true,
                                         dataRowMaxHeight: 250,
                                         columnSpacing: 30,
                                        //  dataRowHeight: 30,
                                        border: TableBorder.all(color: Colors.black,width: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.white30,
                                          
                                        ),
                                        dividerThickness: 2,
                                        
                                        headingRowColor:  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.hovered)) {
                                          return Colors.blue.withOpacity(0.5); // Color when hovered
                                        }
                                        return Color.fromARGB(255, 191, 245, 129); // Default color for heading row
                                      },
                                                                  ),
                                                              columns:const [
                                                                // DataColumn(label: Text('Sno'),),
                                                                DataColumn(label: Text('PAID'),),
                                                                DataColumn(label: Text('DATE'),),
                                                                DataColumn(label: Text('RICE MILL NAME'),),
                                                                DataColumn(label: Text('PARTY NAME'),),
                                                                DataColumn(label: Text('DETAILS'),),
                                                                // DataColumn(label: Text('Place'),),
                                                                DataColumn(label: Text('DISCOUNT'),),
                                                                DataColumn(label: Text('LORRY NO'),),
                                                              ],
                                 rows:searchData.items!.map((item) =>             
                                        DataRow(
                                            cells: [
                                              DataCell(
                                                   Checkbox(value: item.paid, onChanged: (isPaid)
                                                   {
                                                       _showCustomDialog(context,item);     
                                                   })
                                              ),
                                              // DataCell(Icon(item.paid!? Icons.check: Icons.clear_outlined ,color: item.paid!?  Colors.green:Colors.red,)),
                                              DataCell(Text(item.dateobj.toString())),
                                              DataCell(Text(item.ricemill.toString())),
                                              DataCell(Text(item.party.toString())),
                                              DataCell(_showAlertDialog2(item.bill,item.discount!.toInt())),
                                              DataCell(Text(item.discount.toString())),
                                              DataCell(Text(item.lorry.toString())),
                                              // DataCell(InkWell(
                                              //   onTap: (){
                                              //        _showAlertDialog(item.bill);
                                                  
                                              //   },
                                              //   child: Icon(Icons.arrow_forward_ios,color: Colors.green,))
                                              //  ),
                                              
                                            ]))
                                                                  .toList(),
                                                            ),
                                    ),
                                  ),
                               ),
                           ),
                       ),
              ),
            ],
          ),
        ),
      ),
    );
  }


void _showCustomDialog(BuildContext context,Items item) {
  DateObj.text=item.dateobj.toString();
  RiceMillName.text=item.ricemill.toString();
  PartyName.text=item.party.toString();
  District.text=item.district.toString();
  Discount.text=item.discount.toString();
  LorryNo.text=item.lorry.toString();
  TransPort.text=item.TransPort.toString();
  
  itemsController.clear();
  String id=item.sId.toString();

 print("id");
 print(id);
  // paid=item.paid!;
  
        arrayIndex=0;
      item.bill!.forEach((e){ 
      
           itemsController.add(TextEditingController(
             text: e.rice
           ));
           itemsController.add(TextEditingController(
             text: e.bags.toString()
           ));
           itemsController.add(TextEditingController(
             text: e.kg.toString()
           ));
           itemsController.add(TextEditingController(
             text: e.rate.toString()
           ));
           itemsController.add(TextEditingController(
             text: e.received.toString()
           ));


   });

  showDialog(

    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), // Custom shape
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end, // Shrink to fit content
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Payment Details',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Row(
                        children: [
                               ElevatedButton(
                                    child: Text("Update"),
                                    onPressed: () {
                                       updatedata(id);
                                      Navigator.of(context).pop();  // Close the dialog
                                    },
                              ),
                              const SizedBox(width: 20,),
                              InkWell(
                                onTap: () {
                                    
                                      Navigator.of(context).pop();  // Close the dialog
                                    },
                                child: Icon(Icons.close,size: 20, color: Colors.black,))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                          InputDate("Date",TextInputType.datetime,DateObj,Icons.data_exploration),
                          Input("RiceMillName",TextInputType.name,RiceMillName,Icons.near_me),
                          Input("PartyName",TextInputType.name,PartyName,Icons.near_me),
                          Input("District",TextInputType.name,District,Icons.place),
                          Input("Discount",TextInputType.number,Discount,Icons.discord),
                          addRicePack(item.bill!),
                         SizedBox(height: 20),
                         Row(
                           children: [
                             Obx(() =>    Checkbox(value: paid.value, onChanged: (pd){
                                          
                                               paid.value=pd!; 
                                        
                                })),
                                SizedBox(width: 20,),
                                Text("Paid")
                           ],
                         ),
                ElevatedButton(
                  child: Text("Update"),
                  onPressed: () {
                    updatedata(id);
                    Navigator.of(context).pop();  // Close the dialog
                  },
                ),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      );
    },
  );
}


void updatedata(id) async
{

        var Bill=[];


          for(int i=0;i<itemsController.length;i+=5) {
                  Bill.add(
                                {
                                            'rice':itemsController[i].text,
                                            'Bags':itemsController[i+3].text,
                                            'kg':itemsController[i+1].text,
                                            'rate':itemsController[i+2].text,
                                            'received':itemsController[i+4].text,
                                }
                );

          }


         

  try{
     final SharedPreferences Detailsuser = await SharedPreferences.getInstance();
    // final String id = Detailsuser.getString('id').toString();
     final response = await http.patch(
    Uri.parse('${path}/update/'+userid+"/"+id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
        'ricemill':RiceMillName.text,
        'party':PartyName.text,
        'lorry':LorryNo.text,
        'Dateobj':DateObj.text,
        'district':District.text,
        'phoneNo':phoneno.text,
        'Transport':TransPort.text,
        'kiraya':Kiraya.text,
        'advance':Advance.text,
        'discount':Discount.text,
        'paid':paid.value,
        'Bill':Bill
       }),
    
  );
  }catch(e)
  {
       print("error");
       print(e);
  }
   
   getdata();

}



void getdata()async{
         
          final SharedPreferences Detailsuser = await SharedPreferences.getInstance();
          final String id = Detailsuser.getString('id').toString();
          //  http://localhost:5000
          var url="${path}/admin/display/"+userid;

          try{
          final response = await http.get(Uri.parse(url));
          if (response.statusCode == 200) {
              setState(() {
                widget.data = Autogenerated.fromJson(jsonDecode(response.body));
              });
             
          } else {
            // throw Exception('Failed to load album');
          }
          }catch(e){
              print(e);
          }
  }



 Widget addRicePack(List<Bill> bills)
 {
  
    return Container(
        height: 400,
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          
          itemBuilder: (context, index) {
                return Container(
                  width: 500,
                  margin: EdgeInsets.all(10),
                    child: Column(
                       children: [
                              Input("Rice Name",TextInputType.name,itemsController[arrayIndex++],Icons.near_me),
                              Input("Bags",TextInputType.number,itemsController[arrayIndex++],Icons.badge_sharp),
                              Input("Kgs",TextInputType.number,itemsController[arrayIndex++],Icons.king_bed_sharp),
                              Input("Rate",TextInputType.number,itemsController[arrayIndex++],Icons.radio),
                              Input("Amount Received",TextInputType.number,itemsController[arrayIndex++],Icons.radio),
                       ],
                    ),
                );
         },
         itemCount: bills.length,

        ) ,
    );
      
 }
 

 void updateAmount(){
     
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


   Widget _showAlertDialog2( List<Bill>? bill,int discount){

    List<DataRow> list=[];
    double totalAmount=0;
    double dueAmount=0;
    double receivedAmount=0;

     bill!.map((item) {
                         // we return a DataRow every time
                         double Quintal= ( (double.parse(item.bags.toString()) *  double.parse(item.kg.toString())) / 100 ).toDouble();
                         double total= ( (double.parse(item.bags.toString()) * double.parse(item.rate.toString())* double.parse(item.kg.toString())) / 100 ).toDouble();
                         double received= double.parse(item.received.toString());
                        if(discount!=0)total = (total - total*double.parse(discount.toString())/100);     
                         double remaining=total-received;    
                         totalAmount+=  total;  
                         dueAmount+=  remaining;  
                         receivedAmount +=  received;  
                       list.add( DataRow(
                             // List<DataCell> cells is required in every row
                             cells: [
                            
                               DataCell(Text(item.rice.toString())),
                               DataCell(Text(Quintal.toString())),
                              //  DataCell(Text(item.kg.toString())),
                               DataCell(Text(item.rate.toString())),
                               DataCell(Text(total.toString())),
                               DataCell(Text(received.toString())),
                               DataCell(Text(remaining.toString())),
                               
            ]));}).toList();
        
        list.add(
             DataRow(
               
              cells: [
                              DataCell(Text("".toString())),
                               DataCell(Text("".toString())),
                               DataCell(Text("".toString())),
                               DataCell(Text(totalAmount.toString())),
                               DataCell(Text(receivedAmount.toString())),
                               DataCell(Text(dueAmount.toString())),
                  
             ]
            )
        );
 
  
  
  return Container(
    // height: 400,
    child: SingleChildScrollView(
      child: Column(
                children:  <Widget>[
                       DataTable(
                        // columnSpacing: 40,
                        //  showCheckboxColumn: true,
                        //             //  dataRowMaxHeight: 200,
                        //             border: TableBorder.all(color: Colors.black,
                        //             width: 2),
                                    // decoration: BoxDecoration(
                                    //   color: Colors.white30,
                                      
                                    // ),
                                    // dividerThickness: 2,
                                    headingRowColor:  MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered)) {
                                      return Colors.blue.withOpacity(0.5); // Color when hovered
                                    }
                                    return Color.fromARGB(255, 215, 219, 210); // Default color for heading row
                                  },
                                    ),
                          //  dataRowMaxHeight: 400,
                                        columns:const [
                                          // DataColumn(label: Text('Sno'),),
                                          DataColumn(label: Text('Rice Name'),),
                                          DataColumn(label: Text('Quintal'),),
                                          // DataColumn(label: Text('Kgs'),),
                                          DataColumn(label: Text('Rate'),),
                                          DataColumn(label: Text('Total'),),
                                          DataColumn(label: Text('Received'),),
                                          DataColumn(label: Text('Due'),),
                                      
                        ],
                        rows : list,
                  //  rows: bill!.map((item) {
                  //        // we return a DataRow every time
                  //        double Quintal= ( (double.parse(item.bags.toString()) *  double.parse(item.kg.toString())) / 100 ).toDouble();
                  //        double total= ( (double.parse(item.bags.toString()) * double.parse(item.rate.toString())* double.parse(item.kg.toString())) / 100 ).toDouble();
                  //        double received= double.parse(item.received.toString());
                  //       if(discount!=0)total = (total - total*double.parse(discount.toString())/100);     
                  //        double remaining=total-received;        
                  //      return  DataRow(
                  //            // List<DataCell> cells is required in every row
                  //            cells: [
                            
                  //              DataCell(Text(item.rice.toString())),
                  //              DataCell(Text(Quintal.toString())),
                  //             //  DataCell(Text(item.kg.toString())),
                  //              DataCell(Text(item.rate.toString())),
                  //              DataCell(Text(total.toString())),
                  //              DataCell(Text(received.toString())),
                  //              DataCell(Text(remaining.toString())),
                               
                             
                  //             ]);})
                  //                            .toList(),
                       ),
               
               ]  
          ),
    ),
  ); 
         
}



 Widget InputDate(lableText,keyBoard,Textcontroller,icons){

    return Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width/1.1,
          child: TextFormField(
               keyboardType: keyBoard,
                controller: DateObj,
              decoration: InputDecoration(
                labelText: lableText,
                hintText: Sno.text,
                border: OutlineInputBorder(),
                suffixIcon:IconButton( onPressed: ()async{
                      DateTime? dateTime=await showDatePicker(context: context, initialDate: DateTime.now(),
                       firstDate: DateTime(2021), lastDate: DateTime(2025));
                       setState(() {
                           if(dateTime!=null){
                               String str=new DateFormat("dd/MM/yyyy").format(dateTime);
                               DateObj.text=str;
                           }

                       });
                },icon:Icon( Icons.date_range_outlined)),
              ),
            ),
        ),
      );


  }

}


Widget floatingButton(data,context,title)=> InkWell(
        onTap: (){
              generatePdf(PdfPageFormat.a4,title,data,context);
        },
        child: Container(
           decoration: BoxDecoration(
           color: Colors.cyan,
           borderRadius: BorderRadius.circular(100)
           ),
           child: Icon(Icons.print,color: Colors.black,),
           padding: EdgeInsets.all(10),
        ),
      );