//import 'dart:io';

import 'dart:convert';

import 'package:basicappflutter/core/api/mockapi.dart';
import 'package:flutter/material.dart';

class MockAPINotifier extends ChangeNotifier {
  final mockAPI _mockAPI = new mockAPI();
  List _posts = [];
  List get posts => _posts;

  Future getData() async {
    try {
      _mockAPI.getData().then((value) async {
        final List parseData = await jsonDecode(value.toString());
        _posts = parseData;
        print(_posts);
        notifyListeners();
      });
    } catch (error) {
      print(error);
    }
  }

  Future getDataByID({required String id}) async {
    try {
      _mockAPI.getDataByID(id: id);
    } catch (error) {
      print(error);
    }
  }

  Future postData(
      {required String id, required String title, required String body}) async {
    try {
      _mockAPI.postData(id: id, title: title, body: body);
    } catch (error) {
      print(error);
    }
  }

  Future updateData({
    required String id,
    required String title,
  }) async {
    try {
      _mockAPI.updateData(
        id: id,
        title: title,
      );
    } catch (error) {
      print(error);
    }
  }

  Future deleteData({
    required String id,
  }) async {
    try {
      _mockAPI.deleteData(
        id: id,
      );
    } catch (error) {
      print(error);
    }
  }
}
//1hr :24 min 