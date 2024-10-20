import 'package:budget_tracker/screens/transactionpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Ensure the google_fonts package is imported

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Add Transaction',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
          ), // Apply GoogleFonts here for the title
        ),
        content: Text(
          'Would you like to add a new transaction?',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
          ), // Apply GoogleFonts here for the content
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text(
              'Cancel',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ), // Apply GoogleFonts here for the Cancel button
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionPage(),
                ),
              );
            },
            child: Text(
              'Continue',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ), // Apply GoogleFonts here for the Continue button
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpense,
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Set background color
        foregroundColor: Colors.white, // Set icon color
        elevation: 6.0, // Set shadow elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Rounded corners or custom shape
        ),
        tooltip: 'Add Expense', // Tooltip when long-pressed
      ),
    );
  }
}
