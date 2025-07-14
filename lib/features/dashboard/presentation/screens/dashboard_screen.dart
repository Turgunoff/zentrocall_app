import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zentrocall_app/core/widgets/virtual_number_card.dart';
import 'package:zentrocall_app/core/widgets/balance_card.dart';
import 'package:zentrocall_app/core/widgets/dashboard_action_button.dart';
import 'package:zentrocall_app/core/widgets/recent_activity_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/32.jpg',
                ),
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
        title: const Text(
          'ZentroCall',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: bildirishnoma sahifasiga yo‘naltirish
            },
            icon: const Icon(Iconsax.notification),
            tooltip: 'Bildirishnomalar',
            color: Colors.black54,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
