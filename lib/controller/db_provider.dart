import 'package:flutter/foundation.dart';
import 'package:sqflite_practice_sample_1_with_state_managenment_provider/database_service.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider({required this.db});

  List<Map<String, dynamic>> _dataList = [];
  DatabaseService? db;

  void addData(String title, String des) async {
    bool check = await db!.addData(Title: title, Description: des);
    if (check) {
      _dataList = await db!.getAllData();
      notifyListeners();
    }
  }

  void updateData(String title, String des, int s_no) async {
    bool check =
        await db!.updateData(Title: title, Description: des, S_no: s_no);
    if (check) {
      _dataList = await db!.getAllData();
      notifyListeners();
    }
  }

  List<Map<String, dynamic>> getData() => _dataList;

  void getInitialData() async {
    _dataList = await db!.getAllData();
    notifyListeners();
  }
}
