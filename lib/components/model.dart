// import 'dart:ffi';

class Autogenerated {
  String? sId;
  String? userId;
  List<Payment>? payment;
  List<Items>? items;
  int? iV;

  Autogenerated({this.sId, this.userId, this.payment, this.items, this.iV});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    if (json['payment'] != null) {
      payment = <Payment>[];
      json['payment'].forEach((v) {
        payment!.add(new Payment.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    if (this.payment != null) {
      data['payment'] = this.payment!.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Payment {
  String? name;
  String? amount;
  String? dateobj;
  String? sId;
  String? transport;
  String? contactno;
  String? tarik;


  Payment({this.name, this.amount, this.dateobj, this.sId,this.contactno,this.transport,this.tarik});

  Payment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    dateobj = json['Dateobj'];
    sId = json['_id'];
    transport=json['transport'];
    contactno=json['contactno'];
    tarik=json['tarik'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['Dateobj'] = this.dateobj;
    data['_id'] = this.sId;
    data['contactno'] = this.transport;
    data['transport'] = this.sId;
    data['tarik'] = this.tarik;
    return data;
  }
}

class Items {
  String? ricemill;
  String? party;
  String? lorry;
  String? dateobj;
  String? district;
  String? TransPort;
  bool? paid;
  int? discount;
  List<Bill>? bill;
  String? sId;

  Items(
      {this.ricemill,
      this.party,
      this.lorry,
      this.dateobj,
      this.district,
      this.bill,
      this.sId,
      this.paid,
      this.TransPort,
      this.discount
    });

  Items.fromJson(Map<String, dynamic> json) {
    ricemill = json['ricemill'];
    party = json['party'];
    lorry = json['lorry'];
    dateobj = json['Dateobj'];
    district = json['district'];
    TransPort = json['TransPort'] ?? "";
    paid = json['paid'] ?? false;
    discount = json['discount'] ?? 0;
    if (json['Bill'] != null) {
      bill = <Bill>[];
      json['Bill'].forEach((v) {
        bill!.add(new Bill.fromJson(v));
      });
    }
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ricemill'] = this.ricemill;
    data['party'] = this.party;
    data['lorry'] = this.lorry;
    data['Dateobj'] = this.dateobj;
    data['district'] = this.district;
    data['paid'] =this.paid;
    data['discount'] =this.discount;
    data['TransPort'] =this.TransPort ?? "";
    if (this.bill != null) {
      data['Bill'] = this.bill!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class Bill {
  String? rice;
  double? kg;
  double? rate;
  double? received;
  double? bags;
  String? sId;

  Bill({this.rice, this.kg, this.rate, this.bags, this.sId});

  Bill.fromJson(Map<String, dynamic> json) {
    rice = json['rice'].toString();
    kg =   double.parse(json['kg'].toString());
    rate = double.parse(json['rate'].toString());
    bags = double.parse(json['Bags'].toString());
    received = json['received'] !=null ? double.parse(json['received'].toString()):0 ;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rice'] = this.rice;
    data['kg'] = this.kg;
    data['rate'] = this.rate;
    data['Bags'] = this.bags;
    data['received'] = this.received ?? 0;
    data['_id'] = this.sId;
    return data;
  }
}
