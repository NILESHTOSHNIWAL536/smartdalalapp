import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartdalala/components/add.dart';
import 'package:smartdalala/components/menu.dart';
import 'package:smartdalala/components/table.dart';
import 'model.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';




 Future<void> _generatePdf(PdfPageFormat format, String title,Autogenerated data,contextBui) async {
    final pdf = pw.Document();

    // final font = await PdfGoogleFonts.nunitoExtraLight();
try{
    pdf.addPage(
      pw.MultiPage(
        // pageFormat: PdfPageFormat.a,
        // orientation: ,
        

        build: (context) {
          return[   
              printDoc(data,contextBui),
              buildPDFTable(data,contextBui),
          ];
        },
      ),
    );
}catch(e){
    print("error"+e.toString());
}
  
     Printing.layoutPdf(onLayout: (PdfPageFormat format) async=> pdf.save() );

     
      // pdf.save();
  }

// Future<void> printDoc() async {

// doc.addPage(pw.Page(

// );
// pageFormat: PdfPageFormat.a4,
// build: (pw.Context context) {
// return buildPrintableData(image);
// }));
// await Printing.LayoutPdf(
// onLayout: (PdfPageFormat format) async => doc.save());

// }


class Display extends StatefulWidget {
  Autogenerated data;
   Display({ Key? key,required this.data }) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

 late Autogenerated data;
 bool flag=true;


  void getdata()async{
         
          final SharedPreferences Detailsuser = await SharedPreferences.getInstance();
          final String id = Detailsuser.getString('id').toString();
          //  http://localhost:5000
          var url="${path}/admin/display/"+userid;

          try{
          final response = await http.get(Uri.parse(url));
          if (response.statusCode == 200) {
              setState(() {
               data = Autogenerated.fromJson(jsonDecode(response.body));
               flag=false;
              });
             
          } else {
            // throw Exception('Failed to load album');
          }
          }catch(e){
              print(e);
          }
  }

 @override
  void initState() {
    getdata();
    super.initState();
  }


  Future<void> _showAlertDialog( List<Bill>? bill) async {
 
  if(bill==null)return;

  String total="";

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
                          // dataRowMaxHeight: 400,
                  columns:const [
                    // DataColumn(label: Text('Sno'),),
                    DataColumn(label: Text('Rice Name'),),
                    DataColumn(label: Text('Bags'),),
                    DataColumn(label: Text('Kgs'),),
                    DataColumn(label: Text('Rate'),),
                    DataColumn(label: Text('Total'),),
                
                  ],
                  rows: 
                        bill.map((item) {
                          // we return a DataRow every time
                       double total= ( (double.parse(item.bags.toString()) * double.parse(item.rate.toString())* double.parse(item.kg.toString())) / 100 ).toDouble();

                        return  DataRow(
                              // List<DataCell> cells is required in every row
                              cells: [
                             
                                DataCell(Text(item.rice.toString())),
                                DataCell(Text(item.bags.toString())),
                                DataCell(Text(item.kg.toString())),
                                DataCell(Text(item.rate.toString())),
                                DataCell(Text(total.toString())),
                                
                              
                              ]);})
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
 



  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
             leading: getBack(context),
               backgroundColor: Colors.orange,
               title:const Center(child: Text("Display",style: TextStyle(
                     color: Colors.black,
                     fontSize: 25,
                     fontWeight: FontWeight.bold
               ),)),
      ),
      floatingActionButton: InkWell(
        onTap: (){
              _generatePdf(PdfPageFormat.a4,"Balaji Vasvi",widget.data,context);
        },
        child: Container(
           decoration: BoxDecoration(
           color: Colors.cyan,
           borderRadius: BorderRadius.circular(100)
           ),
           child: Icon(Icons.print,color: Colors.black,),
           padding: EdgeInsets.all(10),
        ),
      ),
      body:  flag? Center(child: CircularProgressIndicator(color: Colors.red,),):  TableDisplay(data: data,)
    );  
  }



   Widget _showAlertDialog2( List<Bill>? bill,int discount){
 
  
  
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
                                          DataColumn(label: Text('Bags'),),
                                          DataColumn(label: Text('Kgs'),),
                                          DataColumn(label: Text('Rate'),),
                                          DataColumn(label: Text('Total'),),
                                      
                        ],
                                        rows: 
                       bill!.map((item) {
                         // we return a DataRow every time
                         double total= ( (double.parse(item.bags.toString()) * double.parse(item.rate.toString())* double.parse(item.kg.toString())) / 100 ).toDouble();
                                   
                        if(discount!=0)total = (total - total*double.parse(discount.toString())/100);     
                       return  DataRow(
                             // List<DataCell> cells is required in every row
                             cells: [
                            
                               DataCell(Text(item.rice.toString())),
                               DataCell(Text(item.bags.toString())),
                               DataCell(Text(item.kg.toString())),
                               DataCell(Text(item.rate.toString())),
                               DataCell(Text(total.toString())),
                               
                             
                              ]);})
                                             .toList(),
                                      ),
               
               ]  
          ),
    ),
  ); 
         
}







  Widget dis(){
     return  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  Text('Main Table 1'),
                  Text('Main Table 2'),
                ],
              ),
              TableRow(
                children: [
                  // Nested table
                  Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Nested Table 1'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Nested Table 2'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Nested Table 3'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Nested Table 4'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text('Main Table 3'),
                ],
              ),
              TableRow(
                children: [
                  Text('Main Table 4'),
                  Text('Main Table 5'),
                ],
              ),
            ],
          ),
        );
  }
}



 printDoc( Autogenerated data,context){
    return pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.center,
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
            Header(),
            pw.SizedBox(height: 10,),
            TextStyleD("Teja Traders Karmanghat",Colors.red,15.0),
            pw.SizedBox(height: 10,),
          // pw.Container(
          //     // margin: pw.EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height,
          //      child: buildPDFTable(data)
          //  ),
    ]);
 }

pw.Widget buildPDFTable(data,context) {
  final pdfContainers = <pw.Widget>[];
  // Divide the data into chunks of 7
  for (var i = 0; i < data.items!.length; i += 7) {
    final chunk = data.items!.sublist(i, i + 7 > data.items!.length ? data.items!.length : i + 7);
    Autogenerated obj=new Autogenerated();
    obj.items=chunk;
    pdfContainers.add(
      pw.Container(
        width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
        margin: pw.EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        // width: double.infinity, // Use double.infinity to take full width
        child: tableContent(obj), // Call tableContent with the chunk
      ),
    );
  }

  return pw.Column(
    children: pdfContainers,
  );
}


  pw.Widget Header() {
       
       return  pw.Column(
        children:[
            TextStyleD("BALAJI VASAVI CORPORATIONS",Colors.red,15.0),
            TextStyleD("rice & broken rice canvassing agent",Colors.black,13.0),
            pw.SizedBox(height: 5,),
            TextStyleD("D.No 7-2-47 , Goushala Bhavan,Near railway Gate,",Colors.black,10.0),
            pw.SizedBox(height: 5,),
            TextStyleD("NIZAMABAD - 503001 (T.S)",Colors.black,10.0), 
        ]
       );
  }


   pw.Widget TextStyleD(text,Color color,size){
      return  pw.Text(text,style: pw.TextStyle(
                              fontSize: size+4,
                              // color:,
                              fontWeight: pw.FontWeight.bold,
                              decoration: pw.TextDecoration.none,
                           ),
                          
                );
  }
 
 
 tableContent(Autogenerated data) {
  return pw.Table.fromTextArray(
    
    headers: [
      'DATE',
      'RICE MILL',
      // 'PARTY NAME',
      // 'LORRY NO',
      "Order List"
    ],
    data: data.items!.map<List<dynamic>>(( item) {
      return [         // Replace icon with check or cross mark
        item.dateobj.toString().substring(0,5).toString(),         // Date
        item.ricemill.toString(),        // Rice Mill Name
        // item.lorry.toString(),
        _buildNestedDetailsTable(item.bill!)  
      ];
    }).toList(),  // Ensure the data is a List<List<dynamic>>
    
    border: pw.TableBorder.all(
      color: PdfColors.black,
      width: 3,
    ),
    cellStyle: pw.TextStyle(
      fontSize: 15,
    ),
    headerStyle: pw.TextStyle(
      fontWeight: pw.FontWeight.bold,
      fontSize: 17,
      color: PdfColors.black,
    ),
    headerDecoration: pw.BoxDecoration(
      color: PdfColors.greenAccent,
    ),
    
    columnWidths: {

    },
  );
}


pw.Widget _buildNestedDetailsTable(List<Bill> details) {
  return pw.Table.fromTextArray(
    headers: [
      'Rice Name',    // Define nested table headers
      'Bags',    // Define nested table headers
      'Kg',
      'Rate',
      'Total'
    ],
    data: details.map<List<String>>((detail) {
       double total= ( (double.parse(detail.bags.toString()) * double.parse(detail.rate.toString())* double.parse(detail.kg.toString())) / 100 ).toDouble();
      return [
        detail.rice.toString(),
        detail.bags.toString(),
        detail.kg.toString(),
        detail.rate.toString(),
        total.toString()
      
      ];
    }).toList(),
    
    border: pw.TableBorder.all(
      color: PdfColors.grey,
      width: 2,
    ),
    cellStyle: pw.TextStyle(fontSize: 12),
    headerStyle: pw.TextStyle(
      fontWeight: pw.FontWeight.bold,
      fontSize: 14,
      color: PdfColors.black,
    ),
    headerDecoration: pw.BoxDecoration(
      color: PdfColors.grey300,
    ),
  );
}

// DataCell(InkWell(
//                                       onTap: (){
//                                            _showAlertDialog(item.bill);
                                        
//                                       },
//                                       child: Icon(Icons.arrow_forward_ios,color: Colors.green,))
//                                      ),