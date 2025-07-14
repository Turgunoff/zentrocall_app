import 'package:flutter/material.dart';

/// Ilova uchun ranglar konstantalari
class AppColors {
  // Asosiy ranglar
  static const Color primary = Color(0xFF2563EB); // ZentroCall Primary (ko'k)
  static const Color primaryDark = Color(0xFF1E40AF); // Qorong'u ko'k
  static const Color primaryLight = Color(0xFF60A5FA); // Yorug' ko'k

  static const Color secondary = Color(0xFF4CAF50); // Yashil
  static const Color secondaryDark = Color(0xFF388E3C);
  static const Color secondaryLight = Color(0xFFC8E6C9);

  // Xatolik va ogohlantirish ranglari
  static const Color error = Color(0xFFF44336); // Qizil
  static const Color warning = Color(0xFFFF9800); // To'q sariq
  static const Color success = Color(0xFF4CAF50); // Yashil
  static const Color info = primary; // Asosiy ko'k

  // Yorug' tema ranglari
  static const Color lightBackground = Color(0xFFFAFAFA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF212121);
  static const Color lightOnBackground = Color(0xFF424242);
  static const Color lightDivider = Color(0xFFE0E0E0);

  // Qorong'u tema ranglari
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkOnSurface = Color(0xFFFFFFFF);
  static const Color darkOnBackground = Color(0xFFE0E0E0);
  static const Color darkDivider = Color(0xFF424242);

  // Gradient ranglar
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
