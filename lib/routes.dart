import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Ilova uchun navigatsiya va marshrutizatsiya
class AppRoutes {
  // Asosiy marshrutlar
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String buyNumber = '/buy-number';
  static const String callHistory = '/call-history';
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
    } else if (name == login) {
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    } else if (name == register) {
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    } else if (name == home) {
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    } else if (name == dashboard) {
      return MaterialPageRoute(builder: (_) => const DashboardScreen());
    } else if (name == buyNumber) {
      return MaterialPageRoute(builder: (_) => const BuyNumberScreen());
    } else if (name == callHistory) {
      return MaterialPageRoute(builder: (_) => const CallHistoryScreen());
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
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
    const CallHistoryScreen(),
    const ChatScreen(),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Bosh sahifa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Raqam sotib olish',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Qo\'ng\'iroqlar tarixi',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Sozlamalar',
          ),
        ],
      ),
    );
  }
}

// Placeholder sahifalar (keyinchalik to'ldiriladi)
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Login Screen')));
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Register Screen')));
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Dashboard Screen')));
}

class BuyNumberScreen extends StatelessWidget {
  const BuyNumberScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Buy Number Screen')));
}

class CallHistoryScreen extends StatelessWidget {
  const CallHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Call History Screen')));
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Chat Screen')));
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Settings Screen')));
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
