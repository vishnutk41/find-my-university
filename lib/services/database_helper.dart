import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../database_local/database_favourite.dart';

class DataBaseHelper {
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'universities.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE universities(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,website TEXT NOT NULL )",
    );
  }

  Future<List<FavouriteUniversity>> getUniversities() async {
    Database db = await instance.database;

    var universities = await db.query('universities', orderBy: 'name');

    List<FavouriteUniversity> universityList = universities.isNotEmpty
        ? universities.map((c) => FavouriteUniversity.fromMap(c)).toList()
        : [];
    return universityList;
  }

  Future<int> add(FavouriteUniversity favouriteUniversity) async {
    Database db = await instance.database;
    return await db.insert('universities', favouriteUniversity.toMap());
  }

  Future<int> remove(String name) async {
    Database db = await instance.database;
    return await db.delete('universities', where: 'name=?', whereArgs: [name]);
  }
}
