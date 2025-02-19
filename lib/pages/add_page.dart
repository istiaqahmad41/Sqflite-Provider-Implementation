import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_practice_sample_1_with_state_managenment_provider/controller/db_provider.dart';

import '../database_service.dart';

class Addpage extends StatelessWidget {
  final bool isUpdate;
  final String title;
  final String des;
  final int s_no;

  // Constructor with named parameters
  Addpage(
      {Key? key,
      this.isUpdate = false,
      this.title = "",
      this.des = "",
      this.s_no = 0})
      : super(key: key);

  TextEditingController title_con = TextEditingController();
  TextEditingController des_con = TextEditingController();

  DatabaseService? dbRef = DatabaseService.database_instance;

  @override
  Widget build(BuildContext context) {
    if (isUpdate) {
      title_con.text = title;
      des_con.text = des;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        centerTitle: true,

        title: Text(
          isUpdate ? 'Update Task' : 'Add Task',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        //title: Text('Add Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Center(
              child: Text(
                isUpdate ? 'Update Task' : 'Add Task',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),*/
            SizedBox(height: 16),
            TextField(
              controller: title_con,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(), // Adds border
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: des_con,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(), // Adds border
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String title_text_catch = title_con.text;
                    String des_text_catch = des_con.text;

                    // Check if either title or description is empty
                    /*     if (title_text_catch.isEmpty || des_text_catch.isEmpty) {
                      showAlertDialog(context,
                          'Please fill out both fields before adding!');
                    } else {
                      // If both fields are not empty, add the data to the database
                      isUpdate
                          ? dbRef!.updateData(
                              Title: title_text_catch,
                              Description: des_text_catch,
                              S_no: s_no)
                          : dbRef!.addData(
                              Title: title_text_catch,
                              Description: des_text_catch,
                            );

                      // getData_from_Database();
                      //
                      // // Close the bottom sheet
                      Navigator.pop(context);
                    }*/

                    if (title_text_catch.isNotEmpty ||
                        des_text_catch.isNotEmpty) {
                      if (isUpdate) {
                        context
                            .read<DatabaseProvider>()
                            .updateData(title_text_catch, des_text_catch, s_no);
                      } else {
                        context
                            .read<DatabaseProvider>()
                            .addData(title_text_catch, des_text_catch);
                      }
                    } else {
                      showAlertDialog(context,
                          'Please fill out both fields before adding!');
                    }

                    Navigator.pop(context);
                  },
                  child: Text(isUpdate ? 'Update' : 'Add'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close bottom sheet
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error!'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
