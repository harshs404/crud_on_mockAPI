import 'package:basicappflutter/core/notifiers/mockAPI_notifier.dart';
import 'package:basicappflutter/meta/views/list_data/list_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// HomeView(always comment the class being declared below it)
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final idController = TextEditingController();
    final bodyController = TextEditingController();
    var _mockAPINotifier = Provider.of<MockAPINotifier>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ListDataView(),
            ),
          );
        },
        child: Icon(Icons.arrow_circle_up),
      ),
      appBar: AppBar(
        title: Text("Home View"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: "Enter title",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: bodyController,
            decoration: InputDecoration(
              hintText: "Enter Body",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: idController,
            decoration: InputDecoration(
              hintText: "Enter ID",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                onPressed: () {
                  _mockAPINotifier.getData();
                },
                child: Text("GET"),
                color: Colors.blue,
              ),
              MaterialButton(
                onPressed: () {
                  _mockAPINotifier.getDataByID(id: idController.text);
                },
                child: Text("GET BY ID"),
                color: Colors.yellowAccent,
              ),
              MaterialButton(
                onPressed: () {
                  _mockAPINotifier.postData(
                      id: idController.text,
                      title: titleController.text,
                      body: bodyController.text);
                },
                child: Text("POST"),
                color: Colors.greenAccent,
              ),
              MaterialButton(
                onPressed: () {
                  _mockAPINotifier.updateData(
                    id: idController.text,
                    title: titleController.text,
                  );
                },
                child: Text("UPDATE"),
                color: Colors.orangeAccent,
              ),
              MaterialButton(
                onPressed: () {
                  _mockAPINotifier.deleteData(
                    id: idController.text,
                  );
                },
                child: Text("DELETE"),
                color: Colors.redAccent,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
