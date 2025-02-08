import 'package:flutter/material.dart';
import 'package:expence_master/models/expence.dart';
import 'package:intl/intl.dart'; // Ensure you import this

class AddNewExpences extends StatefulWidget {
  final Function(ExpenceModel) onAddExpense; // Callback function

  const AddNewExpences({super.key, required this.onAddExpense});

  @override
  State<AddNewExpences> createState() => _AddNewExpencesState();
}

class _AddNewExpencesState extends State<AddNewExpences> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  Category _selectedCategory = Category.leasure;

  // Date variables
  final DateTime initialDate = DateTime.now();
  final DateTime firstDate = DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
  final DateTime lastDate = DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);

  DateTime _selectedDate = DateTime.now();

  Future<void> _openDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate; // Update selected date
      });
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final newExpense = ExpenceModel(
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        date: _selectedDate,
        category: _selectedCategory,
      );

      widget.onAddExpense(newExpense); // Pass the expense to the parent
      Navigator.pop(context); // Close modal
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey, // Assign form key
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjust form height dynamically
          children: [
            // Title TextField
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: "Add new expense title",
                labelText: "Title",
              ),
              keyboardType: TextInputType.text,
              maxLength: 50,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Title is required";
                }
                return null;
              },
            ),

            Row(
              children: [
                // Amount TextField
                Expanded(
                  child: TextFormField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      hintText: "Enter the amount",
                      labelText: "Amount",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Amount is required";
                      }
                      if (double.tryParse(value) == null ||
                          double.parse(value) <= 0) {
                        return "Enter a valid amount";
                      }
                      return null;
                    },
                  ),
                ),

                // Date Picker
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(DateFormat.yMd().format(_selectedDate)),
                      IconButton(
                        onPressed: _openDatePicker,
                        icon: const Icon(Icons.date_range_outlined),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              children: [
                // Category Dropdown
                DropdownButton<Category>(
                  value: _selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.name),
                    );
                  }).toList(),
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFCA1F3D),
                        ),
                        child: const Text(
                          "Close",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: _saveForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFBA00),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
