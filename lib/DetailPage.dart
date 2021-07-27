import 'package:flutter/material.dart';
import 'package:sicakfirsat/models/firsat.dart';

class DetailPage extends StatefulWidget {
  var resim;
  var adi;
  var aciklama;
  DetailPage({this.resim,this.adi,this.aciklama,});

  @override
  _DetailPageState createState() => _DetailPageState();
}



class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              expandedHeight: 250,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.adi),
                background: Image.network(widget.resim,fit: BoxFit.cover,),
              ),
            ),
            SliverToBoxAdapter(
                child: Container(margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(5),
                    child: SingleChildScrollView(child: Text(widget.aciklama,style: Theme.of(context).textTheme.subtitle1),))

            )
          ],
        )
    );
  }
}
