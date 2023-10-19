import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Animationscreen.dart';
import 'package:flutter_application_1/DatabaseHelper.dart';
import 'package:flutter_application_1/menubeverage.dart';

class MenuDetail extends StatelessWidget {
  final Menulist menuItem;
  MenuDetail(this.menuItem);

  void sendToFirebase(Menulist item, int insertedId) async {
    final dbHelper = DatabaseHelper.instance;

    if (item.ingredient != null && item.ingredient.isNotEmpty) {
      int insertedId = await dbHelper.insertMenuItem({
        DatabaseHelper.columnName: item.name,
        DatabaseHelper.columnPump: item.pump.join(','),
        DatabaseHelper.columnImagePath: item.imagePath,
        DatabaseHelper.columnIngredient: item.ingredient,
      });

      print('รายการ pump ของเมนู ${item.name}: ${item.pump}');
      print('เลขที่รายการที่แทรก: $insertedId');

      DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

      Map<String, dynamic> dataToSend = {
        'pump': '$insertedId,${item.pump.join(',')}',
      };
      await databaseReference.child('button').update(dataToSend);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuItem.name, style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(menuItem.imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 2),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menuItem.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Ingredients:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  menuItem.ingredient,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 350,
              height: 70,
              child: ElevatedButton(
                onPressed: () async {
                  final dbHelper = DatabaseHelper.instance;
                  int insertedId = await dbHelper.insertMenuItem({
                    DatabaseHelper.columnName: menuItem.name,
                    DatabaseHelper.columnPump: menuItem.pump.join(','),
                    DatabaseHelper.columnImagePath: menuItem.imagePath,
                    DatabaseHelper.columnIngredient: menuItem.ingredient,
                  });

                  print('รายการ pump ของเมนู ${menuItem.name}: ${menuItem.pump}');
                  print('เลขที่รายการที่แทรก: $insertedId');

                  sendToFirebase(menuItem, insertedId);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Animationscreen(selectedMenuName: menuItem.name),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Confirm Menu',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
