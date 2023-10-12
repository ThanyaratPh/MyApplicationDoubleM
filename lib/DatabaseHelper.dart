import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "mocktailDB.db";
  static final _databaseVersion = 1;
  

  static final table = 'menu_order';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnPump = 'pump';
  static final columnImagePath = 'imagePath';
  static final columnIngredient = 'ingredient';

  // Make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only have a single app-wide reference to the database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
Future _onCreate(Database db, int version) async {
  await db.execute('''
    CREATE TABLE $table (
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL,
      $columnPump TEXT NOT NULL,
      $columnImagePath TEXT NOT NULL,
      $columnIngredient TEXT NOT NULL
    )
    ''');
  }

  // Insert a menu item into the database
  Future<int> insertMenuItem(Map<String, dynamic> row) async {
  Database? db = await instance.database;
  return await db?.insert(table, row) ?? 0;
  }


  // Query all menu items from the database
  Future<List<Map<String, dynamic>>> queryAllMenuItems() async {
    Database? database = await instance.database;
    List<Map<String, dynamic>> rows = await database?.query(table) ?? [];

    return rows;
  }
}
