import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

final List<String> _currency = [
  'USD',
  'EUR',
  'GBP',
  'JPY',
  'CHF',
  'CAD',
  'AUD',
  'CNY',
  'INR',
  'KRW',
  'RUB',
];

class _SettingsState extends State<Settings> {
  bool isDarkmode = false;
  String? _currencyValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'Settings',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            color: Colors.black,
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0), // Use vertical padding only
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                16.0), // Align the content with left padding
                        child: Text(
                          'Settings',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                16.0), // Align the content with left padding
                        child: Text(
                          'Customize your budget tracker experience',
                          style: GoogleFonts.inter(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Currency',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 15), // Adjust width between widgets
                            Flexible(
                              child: DropdownButtonFormField<String>(
                                value: _currencyValue,
                                onChanged: (value) {
                                  setState(() {
                                    _currencyValue = value;
                                  });
                                },
                                hint: Text(
                                  'Select Category',
                                  style: GoogleFonts.inter(
                                    color: Colors.grey,
                                  ),
                                ),
                                items: _currency
                                    .map((category) => DropdownMenuItem<String>(
                                          value: category,
                                          child: Text(category),
                                        ))
                                    .toList(),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Row for Dark Mode and the switch
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                16.0), // Align the content with left padding
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dark Mode',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            Switch(
                              value: isDarkmode,
                              onChanged: (value) {
                                setState(() {
                                  isDarkmode = value;
                                });
                              },
                              activeColor:
                                  Colors.white, // Thumb color when active
                              inactiveThumbColor: const Color.fromARGB(255, 255,
                                  255, 255), // Thumb color when inactive
                              activeTrackColor:
                                  Colors.black, // Track color when active
                              inactiveTrackColor: const Color.fromARGB(255, 234,
                                  234, 234), // Track color when inactive
                            ),
                          ],
                        ),
                      ),

                      // Description text under the Dark Mode toggle
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                16.0), // Align the content with left padding
                        child: Text(
                          'Enable or disable dark mode',
                          style: GoogleFonts.inter(
                            color: Colors.black54,
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
