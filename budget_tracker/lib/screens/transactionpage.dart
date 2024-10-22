import 'package:budget_tracker/screens/HomeSreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String? _selectedCategory; // Variable to store selected category

  // List of categories
  final List<String> _categories = [
    'Food',
    'Transport',
    'Entertainment',
    'Bills',
    'Shopping',
  ];

  @override
  Widget build(BuildContext context) {
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
                          fontSize: 16, // Adjust font size as needed
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
                      const SizedBox(
                          height: 20), // Space between title and text fields
                      Text(
                        'Description',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                            labelText: 'Enter Description',
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Amount',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _amountController,
                        decoration: const InputDecoration(
                            labelText: 'Enter Amount',
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 20),
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
                          border: const OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              print('Income Button Pressed');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 25, 174, 14),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                )),
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
                              print('Expense Button Pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                  0xFFCD0202), // Same red color in hex
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
                            onPressed: () {
                              print('Add Transaction Button Pressed');
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                )),
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
          ],
        ),
      ),
    );
  }
}
