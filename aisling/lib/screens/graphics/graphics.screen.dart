import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GraphicsScreen extends StatelessWidget {
  const GraphicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: () {
            // Navigate to the second screen using a named route.
            context.goNamed('home');
          },
          child: const Text('Launch screen'),
        ),
      );
  }
}
