/// Form validatsiya uchun yordamchi funksiyalar
class Validators {
  /// Email validatsiyasi
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email manzilini kiriting';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'To\'g\'ri email manzilini kiriting';
    }

    return null;
  }

  /// Telefon raqam validatsiyasi
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefon raqamini kiriting';
    }

    // +998 90 123 45 67 formatini qabul qiladi
    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[\s\-\(\)]'), ''))) {
      return 'To\'g\'ri telefon raqamini kiriting';
    }

    return null;
  }

  /// Parol validatsiyasi
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Parolni kiriting';
    }

    if (value.length < 6) {
      return 'Parol kamida 6 ta belgidan iborat bo\'lishi kerak';
    }

    return null;
  }

  /// Parol tasdiqlash validatsiyasi
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Parolni qayta kiriting';
    }

    if (value != password) {
      return 'Parollar mos kelmadi';
    }

    return null;
  }

  /// Matn validatsiyasi (bo'sh bo'lmasligi uchun)
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName to\'ldirilishi shart';
    }

    return null;
  }

  /// Raqam validatsiyasi
  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Raqamni kiriting';
    }

    if (double.tryParse(value) == null) {
      return 'To\'g\'ri raqamni kiriting';
    }

    return null;
  }
}
