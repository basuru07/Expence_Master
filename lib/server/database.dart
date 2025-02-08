import 'package:expence_master/models/expence.dart';
import 'package:hive/hive.dart';

class Database {
  // create a database reference
  final _myBox = Hive.box("expenceDatabase");

  List<ExpenceModel> expenceList = [];

  // create the init expence list funtion
  void createInitialDatabase() {
    expenceList = [
      ExpenceModel(
          title: "Foot Ball",
          amount: 12.5,
          date: DateTime.now(),
          category: Category.leasure),
      ExpenceModel(
          title: "Fried Rice",
          amount: 10,
          date: DateTime.now(),
          category: Category.food),
      ExpenceModel(
          title: "Bag",
          amount: 20,
          date: DateTime.now(),
          category: Category.travel),
    ];
  }
// load the data
  void loadData (){
    final dynamic data = _myBox.get("EXP_DATA");

    // validate the data
    if(data!= null && data is List<dynamic>){
      expenceList = data.cast<ExpenceModel> ().toList();
    }
  }

  // update the data
  Future <void> updateData () async {
    await _myBox.put("EXP_DATA", expenceList);
  }
}
