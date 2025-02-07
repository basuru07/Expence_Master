import 'package:expence_master/models/expence.dart';
import 'package:flutter/material.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
  //expence list
  final List<ExpenceModel> _expenceList = [
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
            backgroundColor: const Color.fromARGB(255, 77, 4, 195),
            elevation: 0,
            actions: [
              Container(
                color: Colors.yellow,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _expenceList.length,
                  itemBuilder: (context, index) {
                    return Text(_expenceList[index].title);
                  },
                ),
              ),
            ],
          )),
    );
  }
}
