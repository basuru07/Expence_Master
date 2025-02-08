import 'package:expence_master/models/expence.dart';
import 'package:expence_master/server/categories_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'pages/expences.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenceModelAdapter());
  Hive.registerAdapter(CategoryAdapter());
  await Hive.openBox("expenceDatabase");
  
  runApp(const MainApp());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Expences(),
    );
  }
}
