import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:splitzy_app/app/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  // TODO: Open Hive boxes here (e.g., for user preferences, groups, expenses)

  // TODO: Initialize Starknet (e.g., WalletConnect, providers)

  runApp(const ProviderScope(child: SplitzyApp()));
}

class SplitzyApp extends ConsumerWidget {
  const SplitzyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider); // Will create this provider

    return MaterialApp.router(
      title: 'Splitzy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: router,
      // TODO: Add darkTheme if desired
      // TODO: Add locale and localization delegates if needed
    );
  }
}
