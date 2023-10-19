import 'package:flutter/material.dart';
import 'package:flutter_application_1/Menudetail.dart';
import 'package:flutter_application_1/menubeverage.dart';

class Listbeverage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beverage',
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
        Menulist list = menu[index];
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
            child: ListTile(
              leading: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(list.imagePath),
                  ),
                ),
              ),
              title: Text(
                list.name,
                style: TextStyle(fontSize: 20),
              ),
               onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuDetail(list)),
                  );
              },
            ),
          );
        },
      ),
    );
  }
}
