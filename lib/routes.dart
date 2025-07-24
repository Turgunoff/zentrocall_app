// Ilova uchun navigatsiya va marshrutizatsiya
// Bu fayl barcha marshrutlar va ularning ekranga bog'lanishini boshqaradi
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zentrocall_app/features/buy_number/presentation/screens/buy_number_screen.dart';
import 'package:zentrocall_app/features/calls/presentation/screens/calls_screen.dart';
import 'package:zentrocall_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:zentrocall_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:zentrocall_app/features/auth/presentation/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentrocall_app/features/settings/presentation/screens/settings_screen.dart';

/// AppRoutes klassi ilovadagi barcha marshrutlarni va ularning ekranga bog'lanishini boshqaradi
class AppRoutes {
  // Asosiy marshrutlar nomlari (string sifatida)
  static const String splash = '/'; // Splash ekran
  static const String login = '/login'; // Login ekran
  static const String register = '/register'; // Ro'yxatdan o'tish ekran
  static const String home = '/home'; // Asosiy (BottomNav) ekran
  static const String dashboard = '/dashboard'; // Dashboard ekran
  static const String buyNumber =
      '/buy-number'; // Virtual raqam sotib olish ekran
  static const String calls = '/calls'; // Qo'ng'iroqlar ekran
  static const String chat = '/chat'; // Chat ekran
  static const String settings = '/settings'; // Sozlamalar ekran
  static const String about = '/about'; // Ilova haqida
  static const String help = '/help'; // Yordam
  static const String profile = '/profile'; // Profil

  /// Marshrut nomiga qarab kerakli ekranni ochib beradi
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;

    // Har bir marshrut uchun mos ekranni qaytaradi
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
    } else {
      // Agar marshrut topilmasa, xatolik ekrani
      return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }

  /// Xatolik sahifasi (404 - topilmadi)
  static Widget _buildNotFoundScreen() {
    return Scaffold(
      appBar: AppBar(title: const Text('Sahifa topilmadi')),
      body: const Center(child: Text('Sahifa mavjud emas')),
    );
  }
}

/// SplashScreen - Ilova yuklanishida birinchi ko'rsatiladigan ekran
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate(); // Ilovani boshlashda navigatsiya
  }

  /// 2 soniya kutib, onboarding ko'rilganmi yo'qmi tekshiradi va mos ekranga yo'naltiradi
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
            const CircularProgressIndicator(), // Yuklanish indikator
          ],
        ),
      ),
    );
  }
}

/// HomeScreen - Asosiy sahifa (Bottom Navigation Bar bilan)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Hozirgi tanlangan tab

  // Har bir tab uchun ekranning ro'yxati
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
            _currentIndex = index; // Tab o'zgarganda indexni yangilash
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

/// RegisterScreen - Ro'yxatdan o'tish ekrani (hozircha oddiy matn)
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Register Screen')));
}

/// ChatScreen - Chat ekrani (hozircha oddiy matn)
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Chat Screen')));
}

/// NotFoundScreen - Topilmagan sahifa uchun ekran
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});
  @override
  Widget build(BuildContext context) => AppRoutes._buildNotFoundScreen();
}
