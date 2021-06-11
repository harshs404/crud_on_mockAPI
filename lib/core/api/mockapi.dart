import 'dart:convert';

import 'package:basicappflutter/app/routes/api_routes.dart';
import 'package:http/http.dart' as http;

class mockAPI {
  final client = http.Client();

  //GET METHOD
  Future getData() async {
    print("fetching data");
    final subUrl = "/posts";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.get(uri, headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
    });
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  //GET METHOD
  Future getDataByID({required String id}) async {
    print("fetching data by ID");
    final subUrl = "/posts/$id";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.get(uri, headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
    });
    if (response.statusCode == 200) {
      print(response.body);
    }
  }

  //POST METHOD
  Future postData(
      {required String id, required String title, required String body}) async {
    print("Posting Data");
    final subUrl = "/posts";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.post(uri,
        body: jsonEncode({"title": title, "body": body, "userid": id}),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        });

    print(response.body); // status code = 201 as objects are created here
  }

  //UPDATE METHOD
  Future updateData({required String id, required String title}) async {
    print("Updating Data");
    final subUrl = "/posts/$id";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.patch(uri,
        body: jsonEncode({
          "title": title,
        }),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        });

    print(response.body);
    print(response.statusCode);
  }

  //DELETE METHOD
  Future deleteData({
    required String id,
  }) async {
    print("Deleting Data");
    final subUrl = "/posts/$id";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.delete(uri, headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
    });

    print(response.body);
    print(response.statusCode);
  }
}
