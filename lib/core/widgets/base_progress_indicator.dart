import 'package:flutter/material.dart';

class BaseProgressIndicator extends StatelessWidget {
  const BaseProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
