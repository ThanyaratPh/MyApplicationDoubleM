import 'package:flutter/material.dart';
import 'package:flutter_application_1/Animationscreen.dart';
import 'package:flutter_application_1/DatabaseHelper.dart';
import 'package:flutter_application_1/Menumixed.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_database/firebase_database.dart';

class Listmixsceen extends StatefulWidget {
  @override
  _ListmixsceenState createState() => _ListmixsceenState();
}

class _ListmixsceenState extends State<Listmixsceen> {
  List<MenuMixed> selectedMenuItems = [];

  @override
  void initState() {
    super.initState();
    selectedMenuItems.clear();
  }


  void clearSelection() {
    setState(() {
      for (var item in menu) {
        item.checkboxValue1 = false;
      }
      selectedMenuItems.clear();
    });
  }

  void updatepumpList() {
    List<int> pump = List.filled(10, 0);

    for (var item in selectedMenuItems) {
      for (int i = 0; i < item.str.length; i++) {
        pump[i] = item.str[i];
      }
    }
  }

  void saveSelectedMenuItemsToDatabase() async {
    final dbHelper = DatabaseHelper.instance;
    List<String> ingredient = [];
    List<int> combinedPump = List.filled(10, 0);

    for (var item in selectedMenuItems) {
      ingredient.add(item.name);
      for (int i = 0; i < item.str.length; i++) {
        combinedPump[i] += item.str[i];
      }
    }

    String combinedPumpString = combinedPump.join(',');
    print('Combined Pump Values: $combinedPumpString'); // Print the combined pump values

    Map<String, dynamic> row = {
      DatabaseHelper.columnName: "Combined Menu",
      DatabaseHelper.columnPump: combinedPumpString,
      DatabaseHelper.columnImagePath: "combined_image.jpg",
      DatabaseHelper.columnIngredient: ingredient.join(','), // Combine ingredient names
    };

    int insertedId = await dbHelper.insertMenuItem(row);
    print('เลขที่รายการที่แทรก: $insertedId');

    setState(() {
      selectedMenuItems.clear();
    });

    // Send data to Realtime Database
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    Map<String, dynamic> dataToSend = {
      'str': '$insertedId,$combinedPumpString',
    };

    await databaseReference.child('button').update(dataToSend);
  }

  Future<List<MenuMixed>> queryAllMenuItems() async {
    final dbHelper = DatabaseHelper.instance;
    Database? database = await dbHelper.database;
    List<Map<String, dynamic>> rows = await database?.query(DatabaseHelper.table) ?? [];

    return rows.map((row) {
      List<int> pumpList = (row[DatabaseHelper.columnPump] as String)
          .split(',')
          .map((str) => int.parse(str))
          .toList();

      return MenuMixed(
        row[DatabaseHelper.columnName],
        pumpList,
        row[DatabaseHelper.columnImagePath],
        false,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mixed',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          MenuMixed item = menu[index];

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: CheckboxListTile(
              value: item.checkboxValue1,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    if (selectedMenuItems.length < 2) {
                      item.checkboxValue1 = true;
                      selectedMenuItems.add(item);
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('แจ้งเตือน'),
                            content: Text('สามารถเลือกได้เพียง 2 เมนูเท่านั้น'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('ตกลง'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } else {
                    item.checkboxValue1 = false;
                    selectedMenuItems.remove(item);
                  }
                  updatepumpList();
                });
              },
              title: Text(
                item.name,
                style: TextStyle(fontSize: 20),
              ),
              secondary: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(item.imagePath),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: selectedMenuItems.length == 2
          ? Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    saveSelectedMenuItemsToDatabase();

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Animationscreen(selectedMenuName: "Mixed menu")),
                    );

                    // เมื่อกดปุ่ม Confirm แล้ว ล้างการเลือก checkbox ทั้งหมด
                    clearSelection();
                  },
                  child: Text('Confirm menu', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
