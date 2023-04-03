// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_saver/model/transactions_model/transactions_model.dart';

class TransactionDataBaseFunctions {
  Future<void> addTransaction(TransactionModel model) async {
    final dbData = await Hive.openBox<TransactionModel>('dbKey');
    await dbData.put(model.id, model);
  }

  Future<List<TransactionModel>> getAllData() async {
    List<TransactionModel> transactionList = [];
    final dbData = await Hive.openBox<TransactionModel>('dbKey');
    transactionList.clear();
    double totalIncome = 0;

    double totalExpense = 0;
    double currentBalance = 0;
    transactionList.addAll(dbData.values);

    return transactionList;
  }

  Future<void> delete(int index) async {
    final _db = await Hive.openBox<TransactionModel>('dbKey');
    await _db.deleteAt(index);
  }

  Future<void> edit(int index, TransactionModel model) async {
    final _db = await Hive.openBox<TransactionModel>('dbKey');
    await _db.putAt(index, model);
  }

  Future<void> deleteAll() async {
    final _db = await Hive.openBox<TransactionModel>('dbKey');
    await _db.deleteFromDisk();
  }
}
