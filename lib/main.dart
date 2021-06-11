import 'package:basicappflutter/app/providers/providers.dart';
import 'package:basicappflutter/meta/views/home_view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: HomeView(),
        debugShowCheckedModeBanner: false,
      ),
      providers: providers,
    );
  }
}


// In API, there will be two sides, client and server.