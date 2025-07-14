import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zentrocall_app/core/constants/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          // Profile Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/32.jpg',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'john.doe@email.com',
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Iconsax.edit, color: AppColors.primary),
                  onPressed: () {},
                  tooltip: 'Edit Profile',
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          // Preferences
          _SettingsSection(
            title: 'Preferences',
            children: [
              _SettingsTile(
                icon: Iconsax.global,
                title: 'Language',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('English', style: TextStyle(color: Colors.black87)),
                    SizedBox(width: 8),
                    Icon(Iconsax.arrow_right_1, color: Colors.black38),
                  ],
                ),
                onTap: () {},
              ),
              _SettingsTile(
                icon: Iconsax.moon,
                title: 'Theme',
                trailing: Switch(value: true, onChanged: (v) {}),
                onTap: null,
              ),
              _SettingsTile(
                icon: Iconsax.notification,
                title: 'Notifications',
                trailing: Switch(value: true, onChanged: (v) {}),
                onTap: null,
              ),
              _SettingsTile(
                icon: Iconsax.music,
                title: 'Ringtone',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Default', style: TextStyle(color: Colors.black87)),
                    SizedBox(width: 8),
                    Icon(Iconsax.arrow_right_1, color: Colors.black38),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
          // Security
          _SettingsSection(
            title: 'Security',
            children: [
              _SettingsTile(
                icon: Iconsax.lock,
                title: 'Change Password',
                onTap: () {},
              ),
              _SettingsTile(
                icon: Iconsax.shield_tick,
                title: 'Two-factor Authentication',
                trailing: Switch(value: false, onChanged: (v) {}),
                onTap: null,
              ),
              _SettingsTile(
                icon: Iconsax.activity,
                title: 'Login Activity',
                onTap: () {},
              ),
            ],
          ),
          // Subscription & Billing
          _SettingsSection(
            title: 'Subscription & Billing',
            children: [
              _SettingsTile(
                icon: Iconsax.star,
                title: 'Active Subscriptions',
                trailing: const Text(
                  'Premium Plan',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {},
              ),
              _SettingsTile(
                icon: Iconsax.card,
                title: 'Payment Methods',
                onTap: () {},
              ),
              _SettingsTile(
                icon: Iconsax.receipt,
                title: 'Purchase History',
                onTap: () {},
              ),
            ],
          ),
          // Support & Info
          _SettingsSection(
            title: 'Support & Info',
            children: [
              _SettingsTile(
                icon: Iconsax.info_circle,
                title: 'Help Center',
                onTap: () {},
              ),
              _SettingsTile(
                icon: Iconsax.headphone,
                title: 'Contact Support',
                onTap: () {},
              ),
              _SettingsTile(
                icon: Iconsax.document,
                title: 'Privacy Policy',
                onTap: () {},
              ),
              _SettingsTile(
                icon: Iconsax.document,
                title: 'Terms of Service',
                onTap: () {},
              ),
              _SettingsTile(
                icon: Iconsax.code,
                title: 'App Version',
                trailing: const Text(
                  'v1.0.0',
                  style: TextStyle(color: Colors.black54),
                ),
                onTap: null,
              ),
            ],
          ),
          // Logout
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Iconsax.logout, color: Colors.black54),
                  title: const Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  onTap: () {},
                ),
                const Divider(height: 0),
                ListTile(
                  leading: const Icon(Iconsax.trash, color: Colors.red),
                  title: const Text(
                    'Delete Account',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  const _SettingsTile({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: trailing,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 28,
      horizontalTitleGap: 12,
    );
  }
}
