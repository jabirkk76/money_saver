// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_saver/model/category_model/category_model.dart';

class CategoryDataBaseFunctions {
  Future<void> insertData(CategoryModel model) async {
    final dbData = await Hive.openBox<CategoryModel>('db');
    dbData.put(model.id, model);
  }

  Future<List<CategoryModel>> getAllData() async {
    List<CategoryModel> categoryList = [];
    final dbData = await Hive.openBox<CategoryModel>('db');
    categoryList.clear();
    categoryList.addAll(dbData.values);
    return categoryList;
  }

  Future<void> delete(int index) async {
    final _db = await Hive.openBox<CategoryModel>('db');
    await _db.deleteAt(index);
  }
}
