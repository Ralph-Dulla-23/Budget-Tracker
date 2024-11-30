import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyProvider extends StateNotifier<String> {
  CurrencyProvider() : super('USD'); // Default currency is set to 'USD'

  // Getter for current currency
  String get currentCurrency => state;

  // Method to set a new currency
  void changeCurrency(String newCurrency) {
    state = newCurrency; // Update the state with the new currency
  }
}
