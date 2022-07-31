import 'package:gtech_project/Datas/Datas.dart';
import 'package:flutter/material.dart';

class InsideOfDetails extends StatelessWidget {
  final Datas dataData;
  InsideOfDetails(this.dataData);

  @override
  Widget build(BuildContext context) {
    String detail = "Detail Page";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          detail,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            dataData.title.toString(),
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Image.network(
                dataData.url.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
