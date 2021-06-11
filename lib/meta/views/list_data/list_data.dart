import 'package:basicappflutter/core/notifiers/mockAPI_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListDataView extends StatefulWidget {
  @override
  _ListDataViewState createState() => _ListDataViewState();
}

class _ListDataViewState extends State<ListDataView> {
  @override
  void initState() {
    Provider.of<MockAPINotifier>(context, listen: false).getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    var _mockApiNotifier = Provider.of<MockAPINotifier>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("List Data View"),
      ),
      body: Container(
        child: FutureBuilder(
          future: _mockApiNotifier.getData(),
          builder: (context, snapshot) {
            if (_mockApiNotifier.posts == null ||
                _mockApiNotifier.posts.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: _mockApiNotifier.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child:
                          Text(_mockApiNotifier.posts[index]['id'].toString()),
                    ),
                    title:
                        Text(_mockApiNotifier.posts[index]['title'].toString()),
                    subtitle:
                        Text(_mockApiNotifier.posts[index]['body'].toString()),
                  );
                });
          },
        ),
      ),
    );
  }
}
