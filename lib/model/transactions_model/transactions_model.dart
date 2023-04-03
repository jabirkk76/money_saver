import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_saver/model/category_model/category_model.dart';
part 'transactions_model.g.dart';

@HiveType(typeId: 3)
class TransactionModel {
  @HiveField(0)
  final String description;
  @HiveField(1)
  final double amount;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final CategoryType type;
  @HiveField(4)
  final CategoryModel category;
  @HiveField(5)
  String? id;
  TransactionModel({
    required this.description,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
    required this.id,
  });
}
