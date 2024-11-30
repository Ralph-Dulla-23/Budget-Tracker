import 'package:budget_tracker/screens/HomeSreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:budget_tracker/global_providers.dart';



void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider); // Listen to the current theme

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme, // Apply the selected theme
      home: const HomeScreen(),
    );
  }
}