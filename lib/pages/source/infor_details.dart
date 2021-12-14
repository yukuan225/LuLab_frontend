import 'package:flutter/material.dart';

class InforDetails extends StatefulWidget {
  InforDetails({Key? key, required this.product}) : super(key: key);
  late final product;

  @override
  _InforDetailsState createState() => _InforDetailsState();
}

class _InforDetailsState extends State<InforDetails> {
  late final infordata = widget.product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("资讯内容"),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            child: Text(infordata.content),
          )
        ],
      )
          // Container(
          //   child: Text(infordata.content),
          // ),
          ),
    );
  }
}
