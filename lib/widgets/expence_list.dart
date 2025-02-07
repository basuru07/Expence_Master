import 'package:expence_master/models/expence.dart';
import 'package:expence_master/widgets/expence_tile.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {
  const ExpenceList({super.key, required this.expenceList, required this.onDeleteExpence});

  final List<ExpenceModel> expenceList;

  final void Function (ExpenceModel expence) onDeleteExpence;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenceList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Dismissible(
              key: ValueKey(expenceList[index]),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                onDeleteExpence(expenceList[index]);
              },
              child: ExpenceTile(
                expence: expenceList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
