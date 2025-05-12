import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splitzy_app/presentation/screens/home_screen.dart'; // Will create this next

// Provider for the router
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        // TODO: Add more routes for different features
        // e.g., /groups, /groups/:id, /expenses/add, /settle, /profile
      ),
    ],
    // TODO: Add error handling (e.g., errorBuilder)
    // TODO: Add redirect logic if needed (e.g., for authentication)
  );
});
