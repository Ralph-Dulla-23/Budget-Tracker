import 'package:budget_tracker/constants/colors.dart';
import 'package:budget_tracker/screens/transactionhistory.dart';
import 'package:budget_tracker/screens/transactionpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // E
import 'package:budget_tracker/screens/settings.dart';

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
                  builder: (context) => const TransactionPage(),
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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'Budget Tracker',
          style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 32),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
            },
          ),
        ],
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
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Balance',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text('Your available funds',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromARGB(255, 74, 74, 74),
                          )),
                      const SizedBox(height: 28.0),
                      Text(
                        '\$1234.56',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: const Color.fromARGB(255, 249, 249, 249),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Transactions',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Your latest financial activities',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color.fromARGB(255, 74, 74, 74),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TransactionRow(
                        category: 'Food',
                        date: '10/21/2024',
                        amount: '-\$10.00',
                      ),
                      const TransactionRow(
                        category: 'Income',
                        date: '10/21/2024',
                        amount: '+\$1000.00',
                      ),
                      const TransactionRow(
                        category: 'Groceries',
                        date: '10/21/2024',
                        amount: '-\$20.00',
                      ),
                      const TransactionRow(
                        category: 'Entertainment',
                        date: '10/21/2024',
                        amount: '-\$30.00',
                      ),
                      const TransactionRow(
                        category: 'Travel',
                        date: '10/21/2024',
                        amount: '-\$40.00',
                      ),
                      const SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TransactionHistory(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(4.0), // Border radius
                            side: const BorderSide(
                              color:
                                  Color.fromARGB(255, 0, 0, 0), // Border color
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.list, color: Colors.black,), 
                            SizedBox(width: 4.0),
                            Text(
                              'View All',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,                              ),
                            ),
                            
                          ],
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
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addNewExpense,
        backgroundColor:
            const Color.fromARGB(255, 0, 0, 0), // Set background color
        foregroundColor: Colors.white, // Set icon color
        label: const Text('AddTransaction'),
        icon: const Icon(Icons.add),
        elevation: 6.0, // Set shadow elevation
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(4), // Rounded corners or custom shape
        ),
        tooltip: 'Add Expense', // Tooltip when long-pressed
      ),
    );
  }
}

class TransactionRow extends StatelessWidget {
  final String category;
  final String date;
  final String amount;

  const TransactionRow({
    Key? key,
    required this.category,
    required this.date,
    required this.amount,
  }) : super(key: key);

  bool isExpense() {
    return amount.startsWith('-');
  }

//  'Food',
//     'Transport',
//     'Entertainment',
//     'Bills',
//     // 'Shopping',
  Map<String, dynamic> getCategoryDetails() {
    switch (category.toLowerCase()) {
      case 'food':
        return {
          'icon': Icons.fastfood,
          'color': Colors.blue,
        };
      case 'travel':
        return {
          'icon': Icons.directions_car,
          'color': Colors.teal,
        };
      case 'entertainment':
        return {
          'icon': Icons.movie,
          'color': Colors.purple,
        };
      case 'bills':
        return {
          'icon': Icons.money,
          'color': Colors.green,
        };
      case 'shopping':
        return {
          'icon': Icons.shopping_cart,
          'color': Colors.orange,
        };
      case 'groceries':
        return {
          'icon': Icons.local_grocery_store,
          'color': Colors.red,
        };
      case 'income':
        return {
          'icon': Icons.attach_money,
          'color': Colors.green,
        };
      default:
        return {
          'icon': Icons.attach_money,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryDetails = getCategoryDetails();
    final iconData = categoryDetails['icon'];
    final categorycolor = categoryDetails['color'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: categorycolor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  iconData,
                  color: categorycolor,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    date,
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isExpense() ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
