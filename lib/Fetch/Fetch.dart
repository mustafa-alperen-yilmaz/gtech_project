import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gtech_project/Datas/Datas.dart';

List<Datas> photosParse(String bodyResponse) {
  var list = json.decode(bodyResponse) as List<dynamic>;
  List<Datas> photos = list.map((phts) => Datas.fromJson(phts)).toList();
  return photos;
}

Future<List<Datas>> photosFetch() async {
  final fetchResponse =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  if (fetchResponse.statusCode == 200) {
    return compute(photosParse, fetchResponse.body);
  } else {
    throw Exception();
  }
}
