import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:budget_tracker/services/transaction_service.dart';
import 'package:budget_tracker/services/currency_provider.dart';
import 'package:budget_tracker/services/theme_provider.dart';
import 'package:budget_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

// Provider for Transaction Service
final transactionServiceProvider = StateNotifierProvider<TransactionService, List<Transaction>>(
  (ref) => TransactionService(),
);

// Theme Provider
final themeProvider = StateNotifierProvider<ThemeProvider, ThemeData>(
  (ref) => ThemeProvider(),
);

// Currency Provider
final currencyProvider = StateNotifierProvider<CurrencyProvider, String>(
  (ref) => CurrencyProvider(),
);