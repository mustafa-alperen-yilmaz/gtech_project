import 'package:gtech_project/Datas/Datas.dart';
import 'package:flutter/material.dart';

class InsideOfDetails extends StatelessWidget {
  final Datas dataData;
  InsideOfDetails(this.dataData);

  @override
  Widget build(BuildContext context) {
    // defining the local variables
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
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          // Show the image into details page
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
