import 'package:flutter/material.dart';
import 'package:tip_calculator/models/tip_data.dart';
import '../screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TipData(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.purple,
        ),
        home: HomePage(),
      ),
    );
  }
}
