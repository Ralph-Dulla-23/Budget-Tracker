import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Financial History',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                                'Transaction History',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'A detailed list of your financial activities',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(child: _buildTransactionList()),
                            ]))))
          ])),
    );
  }
}

Widget _buildTransactionList() {
  final transactions = [
    {"category": "Groceries", "date": "2022-01-01", "amount": 100.0},
    {"category": "Bills", "date": "2022-01-02", "amount": -50.0},
    {"category": "Travel", "date": "2022-01-03", "amount": 200.0},
    {"category": "Food", "date": "2022-01-04", "amount": -75.0},
    {"category": "Entertainment", "date": "2022-01-05", "amount": 150.0},
    {"category": "Shopping", "date": "2022-01-06", "amount": -50.0},
    {"category": "Travel", "date": "2022-01-07", "amount": 100.0},
    {"category": "Bills", "date": "2022-01-08", "amount": -50.0},
    {"category": "Food", "date": "2022-01-09", "amount": -75.0},
  ];

  return ListView.separated(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: transactions.length,
    separatorBuilder: (context, index) => const Divider(),
    itemBuilder: (context, index) {
      final transaction = transactions[index];
      return _buildTransactionItem(
        transaction["category"] as String,
        transaction["date"] as String,
        transaction["amount"] as double,
      );
    },
  );
}

Widget _buildTransactionItem(String category, String date, double amount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
            ),
            ),
            Text(
              date,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Text(
          amount > 0 ? '\$${amount.toStringAsFixed(2)}' : '-\$${amount.abs().toStringAsFixed(2)}',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: amount > 0 ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
