import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zentrocall_app/features/calls/presentation/screens/calls_screen.dart';
import 'package:zentrocall_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:zentrocall_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:zentrocall_app/features/auth/presentation/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentrocall_app/features/settings/presentation/screens/settings_screen.dart';

/// Ilova uchun navigatsiya va marshrutizatsiya
class AppRoutes {
  // Asosiy marshrutlar
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String buyNumber = '/buy-number';
  static const String calls = '/calls';
  static const String chat = '/chat';
  static const String settings = '/settings';
  static const String about = '/about';
  static const String help = '/help';
  static const String profile = '/profile';

  /// Asosiy navigatsiya konfiguratsiyasi
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;

    if (name == splash) {
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    } else if (name == '/onboarding') {
      return MaterialPageRoute(builder: (_) => const OnboardingScreen());
    } else if (name == '/login') {
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    } else if (name == register) {
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    } else if (name == home) {
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    } else if (name == dashboard) {
      return MaterialPageRoute(builder: (_) => const DashboardScreen());
    } else if (name == buyNumber) {
      return MaterialPageRoute(builder: (_) => const BuyNumberScreen());
    } else if (name == calls) {
      return MaterialPageRoute(builder: (_) => const CallsScreen());
    } else if (name == chat) {
      return MaterialPageRoute(builder: (_) => const ChatScreen());
    } else if (name == settings) {
      return MaterialPageRoute(builder: (_) => const SettingsScreen());
    } else if (name == about) {
      return MaterialPageRoute(builder: (_) => const AboutScreen());
    } else if (name == help) {
      return MaterialPageRoute(builder: (_) => const HelpScreen());
    } else if (name == profile) {
      return MaterialPageRoute(builder: (_) => const ProfileScreen());
    } else {
      return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }

  /// Xatolik sahifasi
  static Widget _buildNotFoundScreen() {
    return Scaffold(
      appBar: AppBar(title: const Text('Sahifa topilmadi')),
      body: const Center(child: Text('Sahifa mavjud emas')),
    );
  }
}

/// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final seenOnboarding = prefs.getBool('seen_onboarding') ?? false;
    if (seenOnboarding) {
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      Navigator.of(context).pushReplacementNamed('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo yoki ilova nomi
            const Text(
              'ZentroCall',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

/// Asosiy sahifa (Bottom Navigation Bar bilan)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const BuyNumberScreen(),
    const CallsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home_2), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.category),
            label: 'Numbers',
          ),
          BottomNavigationBarItem(icon: Icon(Iconsax.call), label: 'Calls'),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Register Screen')));
}

class BuyNumberScreen extends StatelessWidget {
  const BuyNumberScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Buy Number Screen')));
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Chat Screen')));
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('About Screen')));
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Help Screen')));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Profile Screen')));
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});
  @override
  Widget build(BuildContext context) => AppRoutes._buildNotFoundScreen();
}
