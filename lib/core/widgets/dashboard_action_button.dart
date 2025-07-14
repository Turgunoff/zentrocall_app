import 'package:flutter/material.dart';

class DashboardActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const DashboardActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFEFF6FF), // Card rangi #EFF6FF
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            // shadow yo'q
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: const Color(0xFF1976D2)),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(fontSize: 15, color: Color(0xFF1976D2)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
