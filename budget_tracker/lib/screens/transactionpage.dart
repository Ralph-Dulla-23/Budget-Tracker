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
  final DateTime _currentDate = DateTime.now(); // Store current date

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
          'Transaction Page',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 10.0, bottom: 8.0),
            child: Text(
              'Add Transaction',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 10), // Space between title and description
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Enter the details of your new transaction',
              style: GoogleFonts.inter(
                fontSize: 16, // Adjust font size as needed
              ),
            ),
          ),
          const SizedBox(height: 20), // Space between description and box
          Container(
            padding: const EdgeInsets.all(16.0), // Padding inside the box
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2), // Border color and width
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10.0), // Margin around the box
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaction Details:',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10), // Space between title and text fields
                const Text('Description:'),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter description',
                  ),
                ),
                const SizedBox(height: 10), // Space between fields
                const Text('Amount:'),
                TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter amount',
                  ),
                  keyboardType: TextInputType.number, // Numeric keyboard for amount input
                ),
                const SizedBox(height: 10),
                const Text('Category:'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1), // Border color and width
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                  child: DropdownButton<String>(
                    value: _selectedCategory,
                    hint: const Text('Select category'),
                    isExpanded: true, // Makes the dropdown menu expand to full width
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue; // Update selected category
                      });
                    },
                    items: _categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
