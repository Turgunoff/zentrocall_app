/// Ilova uchun asosiy konstantalar
class AppConstants {
  // Ilova ma'lumotlari
  static const String appName = 'ZentroCall';
  static const String appVersion = '1.0.0';

  // Asset yo'llari
  static const String assetsPath = 'assets';
  static const String imagesPath = '$assetsPath/images';
  static const String iconsPath = '$assetsPath/icons';

  // API konstantalari
  static const String baseUrl = 'https://api.zentrocall.com'; // Mock URL
  static const int apiTimeout = 30000; // 30 soniya

  // Lokal storage kalitlari
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String themeKey = 'app_theme';
  static const String languageKey = 'app_language';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Telefon raqam formatlari
  static const String phoneRegex = r'^\+?[1-9]\d{1,14}$';
  static const String emailRegex =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  // Xatolik xabarlari
  static const String networkError = 'Internet aloqasi yo\'q';
  static const String serverError = 'Server xatosi';
  static const String unknownError = 'Noma\'lum xatolik';

  // Toast xabar vaqtlari
  static const int shortToast = 2000;
  static const int longToast = 4000;
}
