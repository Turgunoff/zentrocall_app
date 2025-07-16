import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';

class BuyNumberScreen extends StatefulWidget {
  const BuyNumberScreen({super.key});

  @override
  State<BuyNumberScreen> createState() => _BuyNumberScreenState();
}

class _BuyNumberScreenState extends State<BuyNumberScreen> {
  int _selectedType = 0; // 0: All, 1: Mobile, 2: Local
  String _search = '';
  int? _buyingIndex;
  int? _boughtIndex;
  int? _selectedCountry; // null by default, all countries

  final List<Map<String, String>> countries = [
    {'name': 'United States', 'code': '+1', 'flag': 'us'},
    {'name': 'United Kingdom', 'code': '+44', 'flag': 'gb'},
    {'name': 'Canada', 'code': '+1', 'flag': 'ca'},
    {'name': 'Germany', 'code': '+49', 'flag': 'de'},
    {'name': 'Uzbekistan', 'code': '+998', 'flag': 'uz'},
    {'name': 'France', 'code': '+33', 'flag': 'fr'},
    {'name': 'Italy', 'code': '+39', 'flag': 'it'},
    {'name': 'Spain', 'code': '+34', 'flag': 'es'},
    {'name': 'Turkey', 'code': '+90', 'flag': 'tr'},
    {'name': 'Russia', 'code': '+7', 'flag': 'ru'},
    {'name': 'India', 'code': '+91', 'flag': 'in'},
    {'name': 'China', 'code': '+86', 'flag': 'cn'},
    {'name': 'Japan', 'code': '+81', 'flag': 'jp'},
    {'name': 'Brazil', 'code': '+55', 'flag': 'br'},
    {'name': 'Australia', 'code': '+61', 'flag': 'au'},
  ];

  final List<Map<String, dynamic>> numbers = [
    // United States
    {
      'number': '+1 312 555 7890',
      'country': 'us',
      'price': ' 41.5/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$1.5, then \$1.5/mo. No extra charges.',
    },
    {
      'number': '+1 646 555 1234',
      'country': 'us',
      'price': ' 42.0/mo',
      'features': ['Voice'],
      'priceDetails': 'First month: \$2.0, then \$2.0/mo. No extra charges.',
    },
    // United Kingdom
    {
      'number': '+44 20 7946 0958',
      'country': 'gb',
      'price': ' 41.8/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$1.8, then \$1.8/mo. No extra charges.',
    },
    // Canada
    {
      'number': '+1 416 555 0199',
      'country': 'ca',
      'price': ' 41.6/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$1.6, then \$1.6/mo. No extra charges.',
    },
    // Germany
    {
      'number': '+49 30 123456',
      'country': 'de',
      'price': ' 42.2/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$2.2, then \$2.2/mo. No extra charges.',
    },
    // Uzbekistan
    {
      'number': '+998 90 123 45 67',
      'country': 'uz',
      'price': ' 41.9/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$1.9, then \$1.9/mo. No extra charges.',
    },
    // France
    {
      'number': '+33 1 23 45 67 89',
      'country': 'fr',
      'price': ' 42.1/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$2.1, then \$2.1/mo. No extra charges.',
    },
    // Italy
    {
      'number': '+39 06 1234 5678',
      'country': 'it',
      'price': ' 41.7/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$1.7, then \$1.7/mo. No extra charges.',
    },
    // Spain
    {
      'number': '+34 91 123 4567',
      'country': 'es',
      'price': ' 41.8/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$1.8, then \$1.8/mo. No extra charges.',
    },
    // Turkey
    {
      'number': '+90 212 555 1234',
      'country': 'tr',
      'price': ' 41.5/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$1.5, then \$1.5/mo. No extra charges.',
    },
    // Russia
    {
      'number': '+7 495 123-45-67',
      'country': 'ru',
      'price': ' 42.0/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$2.0, then \$2.0/mo. No extra charges.',
    },
    // India
    {
      'number': '+91 22 1234 5678',
      'country': 'in',
      'price': ' 41.3/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$1.3, then \$1.3/mo. No extra charges.',
    },
    // China
    {
      'number': '+86 10 1234 5678',
      'country': 'cn',
      'price': ' 41.6/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$1.6, then \$1.6/mo. No extra charges.',
    },
    // Japan
    {
      'number': '+81 3-1234-5678',
      'country': 'jp',
      'price': ' 42.3/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$2.3, then \$2.3/mo. No extra charges.',
    },
    // Brazil
    {
      'number': '+55 11 91234-5678',
      'country': 'br',
      'price': ' 41.4/mo',
      'features': ['Voice'],
      'priceDetails': 'First month: \$1.4, then \$1.4/mo. No extra charges.',
    },
    // Australia
    {
      'number': '+61 2 1234 5678',
      'country': 'au',
      'price': ' 41.9/mo',
      'features': ['Voice', 'SMS'],
      'priceDetails': 'First month: \$1.9, then \$1.9/mo. No extra charges.',
    },
  ];

  List<Map<String, dynamic>> get filteredNumbers {
    final query = _search.trim();
    List<Map<String, dynamic>> baseList;
    if (_selectedCountry == null) {
      baseList = numbers;
    } else {
      final selectedCountryCode = countries[_selectedCountry!]['flag'];
      baseList = numbers
          .where((item) => item['country'] == selectedCountryCode)
          .toList();
    }
    // Type filter
    if (_selectedType == 1) {
      // Mobile: faqat Voice va SMS bo'lgan raqamlar
      baseList = baseList.where((item) {
        final features = List<String>.from(item['features']);
        return features.contains('Voice') && features.contains('SMS');
      }).toList();
    } else if (_selectedType == 2) {
      // Local: faqat Voice bo'lgan raqamlar (SMS bo'lmasligi mumkin)
      baseList = baseList.where((item) {
        final features = List<String>.from(item['features']);
        return features.contains('Voice') && !features.contains('SMS');
      }).toList();
    }
    // Search filter
    if (query.isEmpty) return baseList;
    return baseList
        .where((item) => item['number'].toString().contains(query))
        .toList();
  }

  Future<void> _showCountryPicker() async {
    String search = '';
    int? selected = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        List<Map<String, String>> filtered = countries;
        final double topPadding = MediaQuery.of(context).padding.top;
        final double appBarHeight = kToolbarHeight;
        final double maxHeight =
            MediaQuery.of(context).size.height - topPadding - appBarHeight;
        return DraggableScrollableSheet(
          initialChildSize: 0.90,
          minChildSize: 0.6,
          maxChildSize: 0.90,
          expand: false,
          builder: (context, scrollController) {
            return StatefulBuilder(
              builder: (context, setModalState) {
                filtered = countries
                    .where(
                      (c) =>
                          c['name']!.toLowerCase().contains(
                            search.toLowerCase(),
                          ) ||
                          c['code']!.contains(search),
                    )
                    .toList();
                return Container(
                  constraints: BoxConstraints(maxHeight: maxHeight),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: TextField(
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Search country or code',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Theme.of(
                                context,
                              ).iconTheme.color?.withOpacity(0.7),
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.fillColor ??
                                Theme.of(context).colorScheme.surface,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (val) => setModalState(() => search = val),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.public,
                          color: Theme.of(
                            context,
                          ).iconTheme.color?.withOpacity(0.7),
                        ),
                        title: const Text('All countries'),
                        onTap: () => Navigator.pop(ctx, null),
                        selected: _selectedCountry == null,
                      ),
                      Expanded(
                        child: ListView.separated(
                          controller: scrollController,
                          itemCount: filtered.length,
                          separatorBuilder: (_, __) => Divider(
                            height: 0,
                            color: Theme.of(context).dividerColor,
                          ),
                          itemBuilder: (ctx, i) {
                            final country = filtered[i];
                            final isSelected =
                                countries.indexOf(country) == _selectedCountry;
                            return InkWell(
                              onTap: () => Navigator.pop(
                                ctx,
                                countries.indexOf(country),
                              ),
                              child: Container(
                                color: isSelected
                                    ? Theme.of(
                                        context,
                                      ).colorScheme.primary.withOpacity(0.07)
                                    : Colors.transparent,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                child: Row(
                                  children: [
                                    CountryFlag.fromCountryCode(
                                      country['flag']!,
                                      height: 28,
                                      width: 28,
                                      shape: Circle(),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Text(
                                        country['name']!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Theme.of(
                                            context,
                                          ).textTheme.bodyLarge?.color,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      country['code']!,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.color
                                            ?.withOpacity(0.7),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
    setState(() => _selectedCountry = selected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Number'),
        centerTitle: true,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // Country selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GestureDetector(
              onTap: _showCountryPicker,
              child: Row(
                children: [
                  if (_selectedCountry != null)
                    CountryFlag.fromCountryCode(
                      countries[_selectedCountry!]['flag']!,
                      height: 28,
                      width: 28,
                      shape: Circle(),
                    )
                  else
                    Icon(
                      Icons.flag_outlined,
                      size: 28,
                      color:
                          Theme.of(context).iconTheme.color?.withOpacity(0.7) ??
                          Colors.grey,
                    ),
                  const SizedBox(width: 8),
                  Text(
                    _selectedCountry != null
                        ? countries[_selectedCountry!]['name']!
                        : 'All countries',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  if (_selectedCountry != null) ...[
                    const SizedBox(width: 4),
                    Text(
                      countries[_selectedCountry!]['code']!,
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).textTheme.bodySmall?.color?.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  const SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                    color: Theme.of(context).iconTheme.color?.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a number (e.g. 555, 777)',
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color?.withOpacity(0.7),
                ),
                filled: true,
                fillColor:
                    Theme.of(context).inputDecorationTheme.fillColor ??
                    Theme.of(context).colorScheme.surface,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (val) => setState(() => _search = val),
            ),
          ),
          // Filter chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _TypeChip(
                  label: 'All',
                  selected: _selectedType == 0,
                  onTap: () => setState(() => _selectedType = 0),
                ),
                const SizedBox(width: 8),
                _TypeChip(
                  label: 'Mobile',
                  selected: _selectedType == 1,
                  onTap: () => setState(() => _selectedType = 1),
                ),
                const SizedBox(width: 8),
                _TypeChip(
                  label: 'Local',
                  selected: _selectedType == 2,
                  onTap: () => setState(() => _selectedType = 2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Number cards
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: filteredNumbers.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final item = filteredNumbers[i];
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                          width: 1.2,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          // Number and features
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      item['number'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    // Info icon removed
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: List.generate(
                                    item['features'].length,
                                    (j) => Padding(
                                      padding: EdgeInsets.only(
                                        right: j == item['features'].length - 1
                                            ? 0
                                            : 8,
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.08),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          item['features'][j],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Price and Buy button
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    item['price'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  const SizedBox(width: 4),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: const Text('Price Details'),
                                          content: Text(item['priceDetails']),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(ctx),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.help_outline,
                                      size: 18,
                                      color: Colors.blue.shade300,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              _buyingIndex == i
                                  ? const SizedBox(
                                      width: 48,
                                      height: 36,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    )
                                  : _boughtIndex == i
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 32,
                                    )
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 10,
                                        ),
                                        elevation: 0,
                                      ),
                                      onPressed: () async {
                                        setState(() => _buyingIndex = i);
                                        await Future.delayed(
                                          const Duration(seconds: 2),
                                        );
                                        setState(() {
                                          _buyingIndex = null;
                                          _boughtIndex = i;
                                        });
                                        await Future.delayed(
                                          const Duration(seconds: 2),
                                        );
                                        setState(() => _boughtIndex = null);
                                      },
                                      child: const Text('Buy'),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _TypeChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected
                ? Colors.white
                : Theme.of(
                    context,
                  ).textTheme.bodyMedium?.color?.withOpacity(0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
