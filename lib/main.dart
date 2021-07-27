import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sicakfirsat/models/firsat.dart';

import 'DetailPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String url = "https://raw.githubusercontent.com/murat1347/yapaysiniraglari/master/firsat.json";

  Future<List<Firsat>?> _gonderiGetir() async {
   var response = await http.get(Uri.parse(url));
   if (response.statusCode == 200) {
     return (json.decode(response.body) as List)
         .map((tekGonderiMap) => Firsat.fromJson(tekGonderiMap))
         .toList();
   } else {
     throw Exception("Baglanamadık ${response.statusCode}");
   }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: _gonderiGetir(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Firsat>?> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].adi),
                      subtitle: Text(snapshot.data![index].aciklama),
                      leading: CircleAvatar(
                        child: Text(snapshot.data![index].adi.toString()),
                      ),
                      onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(resim: snapshot.data![index].resim,adi : snapshot.data![index].adi,aciklama: snapshot.data![index].aciklama),));                      },
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

 /*FutureBuilder<List<Kisiler>>(
future: tumKisileriGoster(),
builder: (context,snapshot){
if(snapshot.hasData){ // veri var mı yok mu
var kisilerListesi = snapshot.data;
return ListView.builder(
itemCount: kisilerListesi!.length,
itemBuilder: (context,indeks){
var kisi = kisilerListesi[indeks];
return GestureDetector(
onTap: (){
Navigator.push(context,MaterialPageRoute(builder: (context) => PersonelDetay(kisi: kisi,)));
},
*/