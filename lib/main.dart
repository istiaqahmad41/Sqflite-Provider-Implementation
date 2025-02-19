import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_practice_sample_1_with_state_managenment_provider/controller/db_provider.dart';
import 'package:sqflite_practice_sample_1_with_state_managenment_provider/database_service.dart';
import 'package:sqflite_practice_sample_1_with_state_managenment_provider/pages/page_home.dart';


void main() {
  runApp( ChangeNotifierProvider(create: (context)=> DatabaseProvider(db: DatabaseService.database_instance),
    child: sqflite_practice_sample_1_app_with_state_management_provider(),));
}

class sqflite_practice_sample_1_app_with_state_management_provider extends StatelessWidget {
  const sqflite_practice_sample_1_app_with_state_management_provider({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageHome_Sample_1(),
    );
  }
}


