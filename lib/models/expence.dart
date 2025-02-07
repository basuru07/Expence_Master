import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class ExpenceModel{
  final String title;
  final double amount;
  final DateTime date;
  final Category category;  // category enum
  final String id;

  // getter > formated data
  String get getFormatedData{
    return formattedDate.format(date);
  }

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

// date formatter
final  formattedDate = DateFormat.yMd();

// category icons
final CategoryIcons = {
  Category.food : Icons.lunch_dining,
  Category.leasure : Icons.sports_esports,
  Category.travel : Icons.flight_takeoff,
  Category.work : Icons.business_center,
};