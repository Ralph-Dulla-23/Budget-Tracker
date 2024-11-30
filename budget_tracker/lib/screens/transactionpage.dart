import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:budget_tracker/global_providers.dart';
import 'package:budget_tracker/models/transaction.dart';

class TransactionPage extends ConsumerStatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends ConsumerState<TransactionPage> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String? _selectedCategory;
  bool _isExpense = true;

  final List<String> _categories = [
    'Food',
    'Transport',
    'Entertainment',
    'Bills',
    'Shopping',
  ];

  @override
  Widget build(BuildContext context) {
    final transactionService = ref.read(transactionServiceProvider.notifier);

    void _submitTransaction() {
      if (_formKey.currentState?.validate() ?? false) {
        _formKey.currentState?.save();

        final newTransaction = Transaction(
          description: _descriptionController.text,
          amount: double.tryParse(_amountController.text) ?? 0.0,
          category: _selectedCategory ?? '',
          date: DateTime.now(),
          isExpense: _isExpense,
        );

        transactionService.addTransaction(newTransaction);

        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Transaction',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Transaction',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Enter the details of your new transaction',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Transaction Details:',
                          style: GoogleFonts.inter(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Description Field
                        Text(
                          'Description',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Enter Description',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Amount Field
                        Text(
                          'Amount',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Enter Amount',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an amount.';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter a valid number.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Category Field
                        Text(
                          'Category',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: _selectedCategory,
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value;
                            });
                          },
                          hint: Text(
                            'Select Category',
                            style: GoogleFonts.inter(
                              color: Colors.grey,
                            ),
                          ),
                          items: _categories
                              .map((category) => DropdownMenuItem<String>(
                                    value: category,
                                    child: Text(category),
                                  ))
                              .toList(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a category.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  _isExpense = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 25, 174, 14),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              icon: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.add_circle_outline_outlined),
                              ),
                              label: const Text('Income'),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  _isExpense = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFCD0202),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              icon: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.remove_circle_outline_outlined),
                              ),
                              label: const Text('Expense'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _submitTransaction,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text('Add Transaction'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
