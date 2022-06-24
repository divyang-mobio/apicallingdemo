

import 'dart:convert';

import 'package:apicallingdemo/dataconverter.dart';
import 'package:http/http.dart' as http;

class HttpService{
  final String postUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<User>> getData() async {
    final response = await http.get(Uri.parse(postUrl));

    if(response.statusCode == 200){
      List responseJson = json.decode(response.body.toString());
      List<User> post = responseJson.map((e) => User.fromJson(e)).toList();
      return post;
    } else {
      throw "error";
    }
  }
}