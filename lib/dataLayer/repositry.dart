import 'dart:convert';

import 'package:http/http.dart' as http;

import '../domainLayer/models/myModel.dart';

class Repositry {
  Future<MyModel> getData() async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAwMjI4ODk0LCJpYXQiOjE3MDAxNDI0OTQsImp0aSI6ImM0MDg1OWExNmIyMzQ1YTU4ZjU1YjhhMWJiNTgzYzVhIiwidXNlcl9pZCI6Mn0.g6t14KMMDP0CcGlYOyq0xEL6TOIlm-rDtSaT5Ns4AQ0'
    };

    var request = http.Request('GET', Uri.parse('https://dev.minaini.com:2053/r/appointments'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return MyModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      // return MyModel.fromJson( response.  );

      // return MyModel(count: 0, next: "", previous: "", results: []);
    } else {
      print(response.reasonPhrase);
           return MyModel(count: 0, next: "", previous: "", results: []);

    }
  }
}
