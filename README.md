# ZentroCall: Virtual Raqamlar Ilovasi

Ushbu hujjat "ZentroCall" mobil ilovasini Flutter platformasida ishlab chiqish uchun texnik topshiriq va yo'l xaritasi (Roadmap) bo'lib xizmat qiladi.

---

## 1. 🎯 Loyihaning Maqsadi

Foydalanuvchilarga turli davlatlarning virtual raqamlarini harid qilish, ular orqali VoIP texnologiyasi yordamida xalqaro qo'ng'iroqlar va SMS xabarlarni amalga oshirish imkonini beruvchi, xavfsiz, qulay va zamonaviy mobil ilova yaratish.

---

## 2. 🚀 Asosiy Funksionallik

- **Virtual Raqamlar:** Turli davlatlar uchun virtual raqamlarni ko'rish va harid qilish.
- **VoIP Qo'ng'iroqlar:** Harid qilingan raqam orqali chiquvchi va kiruvchi qo'ng'iroqlarni amalga oshirish.
- **SMS Xabarlar:** Virtual raqam orqali SMS yuborish va qabul qilish.
- **Balans va Obunalar:** Ilova ichidagi hisobni to'ldirish va raqamlar uchun oylik obunalarni boshqarish.
- **Qo'ng'iroqlar va SMS Tarixi:** Barcha aloqa tarixini ko'rish va boshqarish.
- **Ko'p Tilli Qo'llab-quvvatlash:** O'zbek, Rus va Ingliz tillarida ishlash.
- **Mavzular:** Yorug' (Light) va Qorong'u (Dark) rejimlarni qo'llab-quvvatlash.

---

## 3. 🛠️ Texnologiyalar Steki

- **Platforma:** Flutter
- **Arxitektura:** Feature-First (Funksiya bo'yicha)
- **State Management:** BLoC (flutter_bloc)
- **UI:** Material Design 3
- **Network:** Dio
- **Lokal Xotira:** SharedPreferences
- **Asosiy Paketlar:** `equatable`, `google_fonts`, `iconsax_flutter`, `flutter_svg`, `intl`, `url_launcher`, `fluttertoast`.

---

## 4. 🗂️ Loyiha Tuzilmasi

lib/  
├── core/ # Umumiy kodlar (tema, konstantalar, vidjetlar)  
├── data/ # Ma'lumotlar qatlami (modellar, repozitoriylar)  
├── features/ # Ilovaning asosiy funksiyalari (har biri alohida papkada)  
│ ├── auth/  
│ ├── buy_number/  
│ ├── call_history/  
│ ├── chat/  
│ ├── dashboard/  
│ ├── dialer/  
│ ├── settings/  
│ └── ...  
├── main.dart # Ilovaning kirish nuqtasi  
└── routes.dart # Navigatsiya (routing)

---

## 5. 🗺️ Ishlab Chiqish Yo'l Xaritasi (Roadmap)

Loyihani quyidagi bosqichlarga bo'lib amalga oshirish tavsiya etiladi.

### **Bosqich 0: Poydevor (Foundation)**

- [ ] `flutter create zentro_call` orqali loyihani yaratish.
- [ ] `pubspec.yaml` fayliga barcha kerakli paketlarni qo'shish.
- [ ] Yuqorida ko'rsatilgan papka tuzilmasini yaratish.
- [ ] `core/theme/` papkasida `light` va `dark` temalarni sozlash.
- [ ] Asosiy navigatsiya `Shell`ini (BottomNavigationBar bilan) yaratish.
- [ ] `Splash Screen`ni tayyorlash.

### **Bosqich 1: Sozlamalar va Statik Sahifalar**

- [ ] **UI:** "Settings" sahifasini dizayn asosida yaratish ("Mundarija" uslubida).
- [ ] **BLoC/Cubit:** `ThemeCubit` yaratish va `Switch` orqali temani o'zgartirish logikasini qo'shish.
- [ ] **UI:** "About", "Help Center" kabi ichki statik sahifalarni yaratish.

### **Bosqich 2: Asosiy Funksiyalar (Mock Data bilan)**

Ushbu bosqichda barcha ma'lumotlar `data/repositories/` ichidagi soxta (mock) ma'lumotlar qaytaruvchi funksiyalardan olinadi.

- [ ] **Raqam Sotib Olish:**

  - [ ] `VirtualNumberModel` yaratish.
  - [ ] `NumbersRepository` (soxta ma'lumotlar bilan) yaratish.
  - [ ] `BuyNumberBloc`, `State` va `Event`'larni yaratish.
  - [ ] "Buy Number" sahifasini `BlocBuilder` bilan BLoC holatlariga bog'lab chizish.

- [ ] **Qo'ng'iroqlar Tarixi:**

  - [ ] `CallLogModel` yaratish.
  - [ ] `CallHistoryRepository` (soxta tarix bilan) yaratish.
  - [ ] `CallHistoryBloc` yaratish.
  - [ ] "Call History" sahifasini UI'sini yaratish va BLoC'ga ulash.

- [ ] **SMS va Suhbatlar:**

  - [ ] `SmsThreadModel` va `MessageModel` yaratish.
  - [ ] `SmsRepository` (soxta suhbatlar bilan) yaratish.
  - [ ] `SmsBloc` va `ChatBloc` yaratish.
  - [ ] "SMS Inbox" va "Chat" sahifalarini UI'sini yaratish va BLoC'larga ulash.

- [ ] **Dialer Sahifasi:**

  - [ ] Faqat UI qismini yaratish. Qo'ng'iroq qilish funksiyasi keyingi bosqichda qo'shiladi.

- [ ] **Asosiy Sahifa (Dashboard):**
  - [ ] Turli BLoC'lardan ma'lumotlarni (balans, aktiv raqam, so'nggi qo'ng'iroqlar) olib ko'rsatadigan sahifani yaratish.

### **Bosqich 3: Backend Integratsiyasi**

- [ ] **Auth:** Foydalanuvchi registratsiyasi va kirish tizimini haqiqiy API bilan integratsiya qilish.
- [ ] **Repository'larni Yangilash:** `data/repositories/` ichidagi barcha soxta ma'lumotlarni `dio` yordamida haqiqiy API chaqiruvlariga almashtirish.
- [ ] **Xatoliklarni Boshqarish:** API'dan keladigan xatoliklarni (masalan, 404, 500) foydalanuvchiga tushunarli qilib ko'rsatish.
- **SIP Integratsiyasi (Eng murakkab qism):**
  - [ ] VoIP qo'ng'iroqlarini amalga oshirish uchun SIP client kutubxonasini integratsiya qilish.
  - [ ] Chiquvchi va kiruvchi qo'ng'iroqlar logikasini yaratish.

### **Bosqich 4: Yakuniy Bosqich va Testlash**

- [ ] Ilovadagi barcha oqimlarni (flows) to'liq testdan o'tkazish.
- [ ] UI'dagi mayda kamchiliklarni to'g'rilash va animatsiyalarni qo'shish.
- [ ] Ilovani optimallashtirish (performance tuning).
- [ ] Google Play Store uchun reliz versiyasini tayyorlash.
