import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:budget_tracker/global_providers.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider).brightness == Brightness.dark;

    final currentCurrency = ref.watch(currencyProvider);
    final currencyNotifier = ref.read(currencyProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dark Mode Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark Mode', style: TextStyle(fontSize: 18)),
                Switch(
                  value: isDarkMode,
                  onChanged: (_) => themeNotifier.toggleTheme(),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Change Currency Dropdown
            const Text('Select Currency', style: TextStyle(fontSize: 18)),
            DropdownButtonFormField<String>(
              value: currentCurrency,
              items: const [
                DropdownMenuItem(value: 'USD', child: Text('USD')),
                DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                DropdownMenuItem(value: 'JPY', child: Text('JPY')),
              ],
              onChanged: (value) {
                if (value != null) {
                  currencyNotifier.changeCurrency(value);
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
