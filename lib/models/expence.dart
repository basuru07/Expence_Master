import 'package:uuid/uuid.dart';

class ExpenceModel{
  final String title;
  final double amount;
  final DateTime date;
  final Category category;  // category enum
  final String id;

// constructor
  ExpenceModel({
    required this.title, 
    required this.amount, 
    required this.date,
    required this.category
    }) : id = uuid;  /// add the unique id
}

// Enum for category
enum Category { food, travel, leasure, work }

// create the unique id
final uuid = Uuid().v4();