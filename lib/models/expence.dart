import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

part 'expence.g.dart';

@HiveType(typeId: 1)

class ExpenceModel{
  @HiveField(0)
  final String title;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final Category category;  // category enum

  @HiveField(4)
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