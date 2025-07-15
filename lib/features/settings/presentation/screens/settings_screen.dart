import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zentrocall_app/core/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zentrocall_app/core/theme/theme_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use theme background color
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        // Use theme appbar color
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        iconTheme: Theme.of(context).iconTheme,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Theme.of(context).dividerColor),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          // Profile Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              // No boxShadow, no border
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
                    children: [
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
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
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              'Preferences',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          _SettingsSection(
            children: [
              _SettingsTile(
                icon: Iconsax.global,
                title: 'Language',
                trailing: Text(
                  'English',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                showRightIcon: true,
                onTap: () {},
              ),
              _divider(context),
              _SettingsTile(
                icon: Iconsax.moon,
                title: 'Dark Mode',
                trailing: BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (context, themeMode) {
                    return Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveThumbColor: Colors.white,
                      activeTrackColor: Colors.grey.shade300,
                      inactiveTrackColor: Colors.grey.shade300,
                      trackOutlineColor: WidgetStateProperty.all(
                        Colors.grey.shade300,
                      ),

                      value: themeMode == ThemeMode.dark,
                      onChanged: (v) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    );
                  },
                ),
                showRightIcon: false,
                onTap: null,
              ),
              _divider(context),
              _SettingsTile(
                icon: Iconsax.notification,
                title: 'Notifications',
                trailing: _InteractiveSwitch(
                  initialValue: true,
                  activeColor: Theme.of(context).colorScheme.primary,
                  inactiveThumbColor: Colors.white,
                  activeTrackColor: Colors.grey.shade300,
                  inactiveTrackColor: Colors.grey.shade300,
                  trackOutlineColor: WidgetStateProperty.all(
                    Colors.grey.shade300,
                  ),
                ),
                showRightIcon: false,
                onTap: null,
              ),
              _divider(context),
              _SettingsTile(
                icon: Iconsax.music,
                title: 'Ringtone',
                trailing: Text(
                  'Default',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                showRightIcon: true,
                onTap: () {},
              ),
            ],
          ),
          // Security
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              'Security',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          _SettingsSection(
            children: [
              _SettingsTile(
                icon: Iconsax.lock,
                title: 'Change Password',
                onTap: () {},
              ),
              _divider(context),
              _SettingsTile(
                icon: Iconsax.shield_tick,
                title: 'Two-factor Authentication',
                trailing: _InteractiveSwitch(
                  initialValue: false,
                  activeColor: Theme.of(context).colorScheme.primary,
                  inactiveThumbColor: Colors.white,
                  activeTrackColor: Colors.grey.shade300,
                  inactiveTrackColor: Colors.grey.shade300,
                  trackOutlineColor: WidgetStateProperty.all(
                    Colors.grey.shade300,
                  ),
                ),
                showRightIcon: false,
                onTap: null,
              ),
              _divider(context),
              _SettingsTile(
                icon: Iconsax.activity,
                title: 'Login Activity',
                onTap: () {},
              ),
            ],
          ),
          // Subscription & Billing
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              'Subscription & Billing',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          _SettingsSection(
            children: [
              _SettingsTile(
                icon: Iconsax.star,
                title: 'Active Subscriptions',
                trailing: Text(
                  'Premium Plan',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {},
              ),
              _divider(context),
              _SettingsTile(
                icon: Iconsax.card,
                title: 'Payment Methods',
                onTap: () {},
              ),
              _divider(context),
              _SettingsTile(
                icon: Iconsax.receipt,
                title: 'Purchase History',
                onTap: () {},
              ),
            ],
          ),
          // Support & Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              'Support & Info',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          _SettingsSection(
            children: [
              _SettingsTile(
                icon: Iconsax.info_circle,
                title: 'Help Center',
                onTap: () {},
              ),
              _divider(context),
              _SettingsTile(
                icon: Iconsax.headphone,
                title: 'Contact Support',
                onTap: () {},
              ),
              _divider(context),
              _SettingsTile(
                icon: Iconsax.document,
                title: 'Privacy Policy',
                onTap: () {},
              ),
              _divider(context),
              _SettingsTile(
                icon: Iconsax.document,
                title: 'Terms of Service',
                onTap: () {},
              ),
              _divider(context),
              _SettingsTile(
                icon: Iconsax.code,
                title: 'App Version',
                trailing: Text(
                  'v1.0.0',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                showRightIcon: false,
                onTap: null,
              ),
            ],
          ),
          // Logout
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              // No boxShadow, no border
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.logout,
                                color: Theme.of(context).iconTheme.color,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Logout',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                _divider(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Iconsax.trash, color: Colors.red, size: 24),
                              const SizedBox(width: 8),
                              Text(
                                'Delete Account',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
  final List<Widget> children;
  const _SettingsSection({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(vertical: 0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        // No boxShadow, no border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

Widget _divider(BuildContext context) => Divider(
  height: 0,
  thickness: 1,
  color: Theme.of(context).dividerColor,
  indent: 16,
  endIndent: 16,
);

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool showRightIcon;
  const _SettingsTile({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
    this.showRightIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
      ),
      trailing: showRightIcon
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (trailing != null) ...[trailing!, const SizedBox(width: 8)],
                const Icon(
                  Iconsax.arrow_right_3,
                  // Use theme icon color
                  color: null,
                  size: 16,
                ),
              ],
            )
          : (trailing ?? null),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 28,
      horizontalTitleGap: 12,
    );
  }
}

class _InteractiveSwitch extends StatefulWidget {
  final bool initialValue;
  final Color? activeColor;
  final Color? inactiveThumbColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final MaterialStateProperty<Color?>? trackOutlineColor;
  const _InteractiveSwitch({
    required this.initialValue,
    this.activeColor,
    this.inactiveThumbColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.trackOutlineColor,
  });

  @override
  State<_InteractiveSwitch> createState() => _InteractiveSwitchState();
}

class _InteractiveSwitchState extends State<_InteractiveSwitch> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (v) => setState(() => value = v),
      activeColor: widget.activeColor,
      inactiveThumbColor: widget.inactiveThumbColor,
      activeTrackColor: widget.activeTrackColor,
      inactiveTrackColor: widget.inactiveTrackColor,
      trackOutlineColor: widget.trackOutlineColor,
    );
  }
}
