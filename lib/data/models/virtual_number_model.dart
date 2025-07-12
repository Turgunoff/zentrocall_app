import 'package:equatable/equatable.dart';

/// Virtual raqam ma'lumotlari modeli
class VirtualNumberModel extends Equatable {
  final String id;
  final String number;
  final String countryCode;
  final String countryName;
  final String city;
  final double price;
  final double monthlyFee;
  final bool isAvailable;
  final bool isPurchased;
  final String? userId;
  final DateTime? purchasedAt;
  final DateTime? expiresAt;

  const VirtualNumberModel({
    required this.id,
    required this.number,
    required this.countryCode,
    required this.countryName,
    required this.city,
    required this.price,
    required this.monthlyFee,
    this.isAvailable = true,
    this.isPurchased = false,
    this.userId,
    this.purchasedAt,
    this.expiresAt,
  });

  /// Raqam formati (masalan: +1 (555) 123-4567)
  String get formattedNumber {
    // Oddiy formatlash logikasi
    if (number.length == 10) {
      return '(${number.substring(0, 3)}) ${number.substring(3, 6)}-${number.substring(6)}';
    }
    return number;
  }

  /// To'liq raqam (mamlakat kodi bilan)
  String get fullNumber {
    return '+$countryCode $formattedNumber';
  }

  /// Raqam aktivligi
  bool get isActive {
    if (!isPurchased) return false;
    if (expiresAt == null) return true;
    return DateTime.now().isBefore(expiresAt!);
  }

  /// Qolgan kunlar
  int? get remainingDays {
    if (expiresAt == null) return null;
    final now = DateTime.now();
    if (now.isAfter(expiresAt!)) return 0;
    return expiresAt!.difference(now).inDays;
  }

  /// JSON dan model yaratish
  factory VirtualNumberModel.fromJson(Map<String, dynamic> json) {
    return VirtualNumberModel(
      id: json['id'] as String,
      number: json['number'] as String,
      countryCode: json['country_code'] as String,
      countryName: json['country_name'] as String,
      city: json['city'] as String,
      price: (json['price'] as num).toDouble(),
      monthlyFee: (json['monthly_fee'] as num).toDouble(),
      isAvailable: json['is_available'] as bool? ?? true,
      isPurchased: json['is_purchased'] as bool? ?? false,
      userId: json['user_id'] as String?,
      purchasedAt: json['purchased_at'] != null
          ? DateTime.parse(json['purchased_at'] as String)
          : null,
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'] as String)
          : null,
    );
  }

  /// Model dan JSON yaratish
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'country_code': countryCode,
      'country_name': countryName,
      'city': city,
      'price': price,
      'monthly_fee': monthlyFee,
      'is_available': isAvailable,
      'is_purchased': isPurchased,
      'user_id': userId,
      'purchased_at': purchasedAt?.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
    };
  }

  /// Nusxasini yangi ma'lumotlar bilan yaratish
  VirtualNumberModel copyWith({
    String? id,
    String? number,
    String? countryCode,
    String? countryName,
    String? city,
    double? price,
    double? monthlyFee,
    bool? isAvailable,
    bool? isPurchased,
    String? userId,
    DateTime? purchasedAt,
    DateTime? expiresAt,
  }) {
    return VirtualNumberModel(
      id: id ?? this.id,
      number: number ?? this.number,
      countryCode: countryCode ?? this.countryCode,
      countryName: countryName ?? this.countryName,
      city: city ?? this.city,
      price: price ?? this.price,
      monthlyFee: monthlyFee ?? this.monthlyFee,
      isAvailable: isAvailable ?? this.isAvailable,
      isPurchased: isPurchased ?? this.isPurchased,
      userId: userId ?? this.userId,
      purchasedAt: purchasedAt ?? this.purchasedAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    number,
    countryCode,
    countryName,
    city,
    price,
    monthlyFee,
    isAvailable,
    isPurchased,
    userId,
    purchasedAt,
    expiresAt,
  ];
}
