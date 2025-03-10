import 'package:expence_master/models/expence.dart';
import 'package:expence_master/server/database.dart';
import 'package:expence_master/widgets/AddNewExpences.dart';
import 'package:expence_master/widgets/expence_list.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pie_chart/pie_chart.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {

final _myBox = Hive.box("expenceDatabase");
Database db = Database();

  //expence list
  // final List<ExpenceModel> _expenceList = [
  //   ExpenceModel(
  //       title: "Foot Ball",
  //       amount: 12.5,
  //       date: DateTime.now(),
  //       category: Category.leasure),
  //   ExpenceModel(
  //       title: "Fried Rice",
  //       amount: 10,
  //       date: DateTime.now(),
  //       category: Category.food),
  //   ExpenceModel(
  //       title: "Bag",
  //       amount: 20,
  //       date: DateTime.now(),
  //       category: Category.travel),
  // ];

  // funtion to open a model overlay
  void _openAddExpencesOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddNewExpences(
          onAddExpense: _addExpense, // Pass the function to add expenses
        );
      },
    );
  }

  void _addExpense(ExpenceModel newExpense) {
    setState(() {
      db.expenceList.add(newExpense); // Add new expense and update UI
      calCategoryValues();
    });
  }

// remove a expence
  void onDeleteExpence(ExpenceModel expence) {
    // store deleting expence
    ExpenceModel deletingExpence = expence;
    setState(() {
      db.expenceList.remove(expence);
      calCategoryValues();
    });

    // show snakbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Delete Succesfull"),
        action: SnackBarAction(
          label: "undo",
          onPressed: () {
            db.expenceList.add(deletingExpence);
          },
        ),
      ),
    );
  }

  double foodVal = 0;
  double travelVal = 0;
  double leasureVal = 0;
  double workVal = 0;

  void calCategoryValues() {
    double foodValTotal = 0;
    double travelValTotal = 0;
    double leasureValTotal = 0;
    double workValTotal = 0;

    for (final expence in db.expenceList) {
      if (expence.category == Category.food) {
        foodValTotal += expence.amount;
      }
      if (expence.category == Category.leasure) {
        leasureValTotal += expence.amount;
      }
      if (expence.category == Category.work) {
        workValTotal += expence.amount;
      }
      if (expence.category == Category.travel) {
        travelValTotal += expence.amount;
      }
    }
    setState(() {
      foodVal = foodValTotal;
      travelVal = travelValTotal;
      leasureVal = leasureValTotal;
      workVal = workValTotal;
    });

    // update dta map
    dataMap = {
      "Food": foodVal,
      "Travel": travelVal,
      "Leasure": leasureVal,
      "Work": workVal,
    };
  }

  @override
  void initState() {
    super.initState();
    
    if(_myBox.get("EXP_DATA") == null){
      db.createInitialDatabase();
      calCategoryValues();
    }else{
      db.loadData();
      calCategoryValues();
    }


  }

  // pie chart
  Map<String, double> dataMap = {
    "Food": 0,
    "Travel": 0,
    "Leasure": 0,
    "Work": 0,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Expence Master",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color(0xFF2E0E12),

            elevation: 0,
            actions: [
              Container(
                color: Color(0xFFFFBA00),
                child: IconButton(
                  onPressed: _openAddExpencesOverlay,
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              PieChart(dataMap: dataMap),
              ExpenceList(
                expenceList: db.expenceList,
                onDeleteExpence: onDeleteExpence,
              ),
            ],
          )),
    );
  }
}
