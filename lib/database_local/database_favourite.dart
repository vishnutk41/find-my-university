import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FavouriteUniversity {
  final int? id;
  final String name;
  final String website;

  FavouriteUniversity({this.id, required this.name, required this.website});

  factory FavouriteUniversity.fromMap(Map<String, dynamic> json) =>
      FavouriteUniversity(
          id: json['id'], name: json['name'], website: json['website']);

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'website': website};
  }
}

//  "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,website TEXT NOT NULL)",
