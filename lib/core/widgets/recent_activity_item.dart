import 'package:flutter/material.dart';

class RecentActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String trailing;
  final bool isSms;
  final VoidCallback? onTap;

  const RecentActivityItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.isSms = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isSms
            ? const Color(0xFF1976D2).withOpacity(0.1)
            : const Color(0xFF1976D2).withOpacity(0.15),
        child: Icon(icon, color: const Color(0xFF1976D2)),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 13)),
      trailing: Text(
        trailing,
        style: TextStyle(
          color: isSms ? Colors.green : Colors.black54,
          fontWeight: isSms ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      minLeadingWidth: 36,
    );
  }
}
