import 'package:flutter/material.dart';
import 'package:zentrocall_app/core/widgets/virtual_number_card.dart';
import 'package:zentrocall_app/core/widgets/balance_card.dart';
import 'package:zentrocall_app/core/widgets/dashboard_action_button.dart';
import 'package:zentrocall_app/core/widgets/recent_activity_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar (profil, title, notification)
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/32.jpg',
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'VirtualNum',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        size: 28,
                      ),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 8,
                      top: 10,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Virtual Number Card
            VirtualNumberCard(
              countryFlag: '🇺🇸',
              number: '+1 555 123 4567',
              status: 'Active',
              statusColor: Colors.green,
              onManage: () {},
            ),
            // Balance Card
            BalanceCard(balance: 3.75, onTopUp: () {}),
            const SizedBox(height: 8),
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: DashboardActionButton(
                    icon: Icons.add_ic_call_rounded,
                    label: 'Buy Number',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DashboardActionButton(
                    icon: Icons.dialpad_rounded,
                    label: 'Make Call',
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DashboardActionButton(
                    icon: Icons.mail_outline_rounded,
                    label: 'Send SMS',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DashboardActionButton(
                    icon: Icons.history,
                    label: 'Call History',
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Activity',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            // Recent Activity List
            RecentActivityItem(
              icon: Icons.call,
              title: '+1 555 987 6543',
              subtitle: 'Today, 2:30 PM',
              trailing: '5:23',
              isSms: false,
              onTap: () {},
            ),
            RecentActivityItem(
              icon: Icons.mail_outline_rounded,
              title: '+1 555 234 5678',
              subtitle: 'Today, 11:45 AM',
              trailing: 'Delivered',
              isSms: true,
              onTap: () {},
            ),
            RecentActivityItem(
              icon: Icons.call,
              title: '+1 555 876 5432',
              subtitle: 'Yesterday, 4:15 PM',
              trailing: '2:45',
              isSms: false,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
