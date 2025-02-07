import 'package:expence_master/models/expence.dart';
import 'package:flutter/material.dart';

class ExpenceTile extends StatelessWidget {
  const ExpenceTile({super.key, required this.expence});

  final ExpenceModel expence;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 88, 213, 241),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expence.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height:4 ,),
                  Row(
                    children: [
                      Text(
                        expence.amount.toStringAsFixed(2),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(CategoryIcons[expence.category],),
                          SizedBox(width: 8,),
              
                          Text(expence.getFormatedData)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}