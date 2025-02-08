import 'package:expence_master/models/expence.dart';
import 'package:flutter/material.dart';

class ExpenceTile extends StatelessWidget {
  const ExpenceTile({super.key, required this.expence});

  final ExpenceModel expence;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2E0E12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expence.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold, // Bold text
                    color: Color(0xFFFFBA00), // White color
                  ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  expence.amount.toStringAsFixed(2),
                  style: TextStyle(color: Color(0xFFFFBA00),)
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      CategoryIcons[expence.category],
                      color: Color(0xFFFFBA00),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      expence.getFormatedData,
                      style: TextStyle(
                        color: Color(0xFFFFBA00),
                      ),
                    )
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
