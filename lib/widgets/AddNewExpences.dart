import 'package:flutter/material.dart';
import 'package:expence_master/models/expence.dart';
import 'package:expence_master/models/expence.dart';

class AddNewExpences extends StatefulWidget {
  const AddNewExpences({super.key});

  @override
  State<AddNewExpences> createState() => _AddNewExpencesState();
}

class _AddNewExpencesState extends State<AddNewExpences> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  Category _selectedCategory = Category.leasure;

  // date variables
  final DateTime initialDate = DateTime.now();
  final DateTime firstDate = DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
  final DateTime lastDate = DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);

  DateTime _selectedData = DateTime.now();

  Future<void> _openDateModel() async {
    try {
      // store the user selected data
      final pickedDate = await showDatePicker(
          context: context, 
          initialDate: initialDate,
          firstDate: firstDate, 
          lastDate: lastDate);

          setState(() {
             _selectedData = pickedDate!;  // update UI elements
          });

          

    } catch (err) {
      print(err.toString());
    }
  }

  void Dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // title text field
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: "Add new expence title",
              label: Text("Title"),
            ),
            keyboardType: TextInputType.text,
            maxLength: 50,
          ),
          Row(
            children: [
              // amount
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    helperText: "Enter the amount",
                    label: Text("Amount"),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(formattedDate.format(_selectedData)),
                    IconButton(
                        onPressed: _openDateModel,
                        icon: Icon(Icons.date_range_outlined)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Close"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.redAccent),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Save"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
