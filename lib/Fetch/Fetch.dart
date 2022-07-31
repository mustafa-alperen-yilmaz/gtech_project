import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gtech_project/Datas/Datas.dart';

List<Datas> datasParse(String bodyResponse) {
  var list = json.decode(bodyResponse) as List<dynamic>;
  List<Datas> photos = list.map((dts) => Datas.fromJson(dts)).toList();
  return photos;
}

Future<List<Datas>> datasFetch() async {
  final fetchResponse =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  if (fetchResponse.statusCode == 200) {
    return compute(datasParse, fetchResponse.body);
  } else {
    throw Exception();
  }
}
