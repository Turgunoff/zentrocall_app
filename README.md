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

## 3. 🛠️ Texnologiyalar va Arxitektura

- **Platforma:** Flutter
- **Arxitektura:** **Feature-First** (Har bir funksiya o'zining papkasida jamlanadi). Bu kodni modullarga ajratish va boshqarishni osonlashtiradi.
- **State Management:** **BLoC** (flutter_bloc). Biznes mantiqini UI qismidan to'liq ajratish uchun. Oddiy holatlar uchun `Cubit` ishlatilishi mumkin.
- **UI:** Material Design 3
- **Network:** Dio (kengaytiriladigan va interceptor'larni qo'llab-quvvatlaydigan HTTP klient).
- **Lokal Xotira:** SharedPreferences (oddiy sozlamalar uchun).
- **Lokalizatsiya:** Flutter'ning o'zining `intl` paketi va `.arb` fayllari orqali.

---

## 4. 🗂️ Loyiha Tuzilmasi

Quyida loyihaning standartlashtirilgan va kengaytirishga qulay papka tuzilmasi keltirilgan.

lib/
├── core/ # Butun ilova uchun umumiy kodlar
│ ├── constants/ # O'zgarmas qiymatlar (ranglar, matn stillari, asset yo'llari)
│ ├── theme/ # Yorug' (light) va qorong'u (dark) mavzular
│ ├── utils/ # Yordamchi funksiyalar (masalan, sana formatlash, validatorlar)
│ └── widgets/ # Qayta ishlatiladigan umumiy vidjetlar (masalan, CustomButton, LoadingIndicator)
│
├── data/ # Ma'lumotlar bilan ishlash qatlami
│ ├── models/ # API'dan keladigan ma'lumotlar uchun modellar (UserModel, NumberModel)
│ └── repositories/ # Ma'lumotlar manbalari (hozircha MOCK, keyinchalik API)
│
├── features/ # Ilovaning asosiy funksiyalari (har biri alohida modul)
│ │
│ └── auth/ # Masalan, Kirish / Ro'yxatdan o'tish funksiyasi
│ ├── presentation/ # UI qatlami
│ │ ├── bloc/ # AuthBloc, AuthState, AuthEvent
│ │ ├── screens/ # LoginScreen, RegisterScreen
│ │ └── widgets/ # Faqat shu funksiyaga tegishli maxsus vidjetlar
│ └── ... # (domain, data qatlamlari shu yerda bo'lishi ham mumkin)
│
├── l10n/ # Lokalizatsiya fayllari
│ ├── app_en.arb
│ ├── app_ru.arb
│ └── app_uz.arb
│
├── main.dart # Ilovaning asosiy kirish nuqtasi (runApp)
└── routes.dart # Navigatsiya va sahifalararo o'tish (routing)

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
- [ ] Lokalizatsiya (`l10n`) uchun dastlabki sozlamalarni qilish.

### **Bosqich 1: Sozlamalar va Statik Sahifalar**

- [ ] **UI:** "Settings" sahifasini dizayn asosida yaratish ("Mundarija" uslubida).
- [ ] **BLoC/Cubit:** `ThemeCubit` yaratish va `Switch` orqali temani o'zgartirish logikasini qo'shish.
- [ ] **UI:** "About", "Help Center" kabi ichki statik sahifalarni yaratish.

### **Bosqich 2: Asosiy Funksiyalar (Mock Data bilan)**

Ushbu bosqichda barcha ma'lumotlar `data/repositories/` ichidagi soxta (mock) ma'lumotlar qaytaruvchi funksiyalardan olinadi.

- [ ] **Raqam Sotib Olish (`buy_number`):**

  - [ ] `VirtualNumberModel` yaratish.
  - [ ] `NumbersRepository` (soxta ma'lumotlar bilan) yaratish.
  - [ ] `BuyNumberBloc`, `State` va `Event`'larni yaratish.
  - [ ] "Buy Number" sahifasini `BlocBuilder` bilan BLoC holatlariga bog'lab chizish.

- [ ] **Qo'ng'iroqlar Tarixi (`call_history`):**

  - [ ] `CallLogModel` yaratish.
  - [ ] `CallHistoryRepository` (soxta tarix bilan) yaratish.
  - [ ] `CallHistoryBloc` yaratish.
  - [ ] "Call History" sahifasini UI'sini yaratish va BLoC'ga ulash.

- [ ] **SMS va Suhbatlar (`chat`):**

  - [ ] `SmsThreadModel` va `MessageModel` yaratish.
  - [ ] `SmsRepository` (soxta suhbatlar bilan) yaratish.
  - [ ] `SmsBloc` va `ChatBloc` yaratish.
  - [ ] "SMS Inbox" va "Chat" sahifalarini UI'sini yaratish va BLoC'larga ulash.

- [ ] **Dialer Sahifasi (`dialer`):**

  - [ ] Faqat UI qismini yaratish. Qo'ng'iroq qilish funksiyasi keyingi bosqichda qo'shiladi.

- [ ] **Asosiy Sahifa (`dashboard`):**
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
