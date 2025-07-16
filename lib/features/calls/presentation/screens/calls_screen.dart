import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  int _selectedFilter = 0; // 0: All, 1: Outgoing, 2: Incoming, 3: Missed
  final List<String> _filters = ['All', 'Outgoing', 'Incoming', 'Missed'];
  int? _expandedIndex;

  final List<_CallItem> callHistory = [
    _CallItem(
      name: 'John Doe',
      time: 'Today, 10:30 AM',
      isMissed: false,
      isOutgoing: true,
      avatar: null,
      sourceNumber: 'Virtual #1',
    ),
    _CallItem(
      name: 'Jane Smith',
      time: 'Yesterday, 8:15 PM',
      isMissed: true,
      isOutgoing: false,
      avatar: null,
      sourceNumber: 'Virtual #2',
    ),
    _CallItem(
      name: 'Alex Johnson',
      time: 'Yesterday, 5:00 PM',
      isMissed: false,
      isOutgoing: false,
      avatar: null,
      sourceNumber: 'Virtual #3',
    ),
    _CallItem(
      name: 'John Doe',
      time: 'Today, 10:30 AM',
      isMissed: false,
      isOutgoing: true,
      avatar: null,
      sourceNumber: 'Virtual #1',
    ),
    _CallItem(
      name: 'Jane Smith',
      time: 'Yesterday, 8:15 PM',
      isMissed: true,
      isOutgoing: false,
      avatar: null,
      sourceNumber: 'Virtual #2',
    ),
    _CallItem(
      name: 'Alex Johnson',
      time: 'Yesterday, 5:00 PM',
      isMissed: false,
      isOutgoing: false,
      avatar: null,
      sourceNumber: 'Virtual #3',
    ),
    _CallItem(
      name: 'John Doe',
      time: 'Today, 10:30 AM',
      isMissed: false,
      isOutgoing: true,
      avatar: null,
      sourceNumber: 'Virtual #1',
    ),
    _CallItem(
      name: 'John Doe',
      time: 'Today, 10:30 AM',
      isMissed: false,
      isOutgoing: true,
      avatar: null,
      sourceNumber: 'Virtual #1',
    ),
    _CallItem(
      name: 'Jane Smith',
      time: 'Yesterday, 8:15 PM',
      isMissed: true,
      isOutgoing: false,
      avatar: null,
      sourceNumber: 'Virtual #2',
    ),
    _CallItem(
      name: 'Alex Johnson',
      time: 'Yesterday, 5:00 PM',
      isMissed: false,
      isOutgoing: false,
      avatar: null,
      sourceNumber: 'Virtual #3',
    ),

    _CallItem(
      name: 'John Doe',
      time: 'Today, 10:30 AM',
      isMissed: false,
      isOutgoing: true,
      avatar: null,
      sourceNumber: 'Virtual #1',
    ),
    _CallItem(
      name: 'Jane Smith',
      time: 'Yesterday, 8:15 PM',
      isMissed: true,
      isOutgoing: false,
      avatar: null,
      sourceNumber: 'Virtual #2',
    ),
    _CallItem(
      name: 'Alex Johnson',
      time: 'Yesterday, 5:00 PM',
      isMissed: false,
      isOutgoing: false,
      avatar: null,
      sourceNumber: 'Virtual #3',
    ),
    _CallItem(
      name: 'Jane Smith',
      time: 'Yesterday, 8:15 PM',
      isMissed: true,
      isOutgoing: false,
      avatar: null,
      sourceNumber: 'Virtual #2',
    ),
    _CallItem(
      name: 'Alex Johnson',
      time: 'Yesterday, 5:00 PM',
      isMissed: false,
      isOutgoing: false,
      avatar: null,
      sourceNumber: 'Virtual #3',
    ),
  ];

  List<_CallItem> get _filteredCalls {
    switch (_selectedFilter) {
      case 1:
        return callHistory.where((c) => c.isOutgoing).toList();
      case 2:
        return callHistory.where((c) => !c.isOutgoing && !c.isMissed).toList();
      case 3:
        return callHistory.where((c) => c.isMissed).toList();
      default:
        return callHistory;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call History'),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Iconsax.search_normal), onPressed: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: List.generate(_filters.length, (i) {
                final isSelected = _selectedFilter == i;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedFilter = i),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: isSelected
                            ? Border(
                                bottom: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2,
                                ),
                              )
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _filters[i],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).textTheme.bodyMedium?.color,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _filteredCalls.length,
        separatorBuilder: (context, index) => Divider(
          height: 0,
          thickness: 1,
          indent: 72,
          endIndent: 16,
          color: Theme.of(context).dividerColor,
        ),
        itemBuilder: (context, index) {
          final call = _filteredCalls[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _expandedIndex = _expandedIndex == index ? null : index;
                  });
                },
                onLongPressStart: (details) async {
                  final selected = await showMenu<String>(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      details.globalPosition.dx,
                      details.globalPosition.dy,
                      details.globalPosition.dx,
                      details.globalPosition.dy,
                    ),
                    items: [
                      PopupMenuItem(
                        value: 'copy',
                        child: Row(
                          children: [
                            Icon(Iconsax.copy, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              'Copy Number',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Iconsax.edit, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              'Edit Number and Call',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Iconsax.trash, size: 18, color: Colors.red),
                            const SizedBox(width: 8),
                            Text(
                              'Delete Number',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );

                  if (selected == 'copy') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Number copied: ${call.sourceNumber}'),
                      ),
                    );
                  } else if (selected == 'edit') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Edit and call: ${call.sourceNumber}'),
                      ),
                    );
                  } else if (selected == 'delete') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Number deleted: ${call.sourceNumber}'),
                      ),
                    );
                  }
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.1),
                    child:
                        call.avatar ??
                        Text(
                          call.name.isNotEmpty ? call.name[0] : '',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                  ),
                  title: Text(
                    call.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            call.isOutgoing
                                ? Iconsax.call_outgoing
                                : call.isMissed
                                ? Iconsax.call_remove
                                : Iconsax.call_incoming,
                            size: 16,
                            color: call.isMissed
                                ? Colors.red
                                : Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            call.time,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: call.isMissed
                                      ? Colors.red
                                      : Theme.of(
                                          context,
                                        ).textTheme.bodySmall?.color,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        call.sourceNumber,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(
                            context,
                          ).textTheme.bodySmall?.color?.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Iconsax.call,
                      color: const Color(
                        0xFF2563EB,
                      ), // #2563EB as primary color
                    ),
                    onPressed: () {
                      // TODO: Implement call action
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  minLeadingWidth: 0,
                ),
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: _expandedIndex == index
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: 72,
                          right: 16,
                          bottom: 8,
                        ),
                        child: Row(
                          children: [
                            _ActionButton(
                              icon: Iconsax.user_add,
                              label: 'Add Contact',
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Add Contact for ${call.name}',
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 16),
                            _ActionButton(
                              icon: Iconsax.sms,
                              label: 'Send SMS',
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Send SMS to ${call.name}'),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 16),
                            _ActionButton(
                              icon: Iconsax.clock,
                              label: 'History',
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Show history for ${call.name}',
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                crossFadeState: _expandedIndex == index
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2563EB), // #2563EB as primary color
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (ctx) => _ClassicDialerSheet(),
          );
        },
        child: const Icon(Iconsax.call_add, color: Colors.white),
      ),
    );
  }
}

class _CallItem {
  final String name;
  final String time;
  final bool isMissed;
  final bool isOutgoing;
  final Widget? avatar;
  final String sourceNumber; // e.g. 'Virtual #1'

  _CallItem({
    required this.name,
    required this.time,
    required this.isMissed,
    required this.isOutgoing,
    required this.sourceNumber,
    this.avatar,
  });
}

// Action button widget for expanded row
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary, size: 22),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// CLASSIC DIALER SHEET (screenshot style)
class _ClassicDialerSheet extends StatefulWidget {
  @override
  State<_ClassicDialerSheet> createState() => _ClassicDialerSheetState();
}

class _ClassicDialerSheetState extends State<_ClassicDialerSheet> {
  String _input = '';
  final t9 = const {
    '1': '',
    '2': 'ABC',
    '3': 'DEF',
    '4': 'GHI',
    '5': 'JKL',
    '6': 'MNO',
    '7': 'PQRS',
    '8': 'TUV',
    '9': 'WXYZ',
    '*': '',
    '0': '+',
    '#': '',
  };
  final keys = const [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['*', '0', '#'],
  ];

  // Country prefix map
  final List<Map<String, dynamic>> _countryPrefixes = [
    {
      'prefix': '+7',
      'name': 'Kazakhstan',
      'pattern': r'^\+7(\d{3})(\d{3})(\d{2})(\d{2})$',
      'format': r'+7 $1 $2 $3 $4',
    },
    {
      'prefix': '+998',
      'name': 'Uzbekistan',
      'pattern': r'^\+998(\d{2})(\d{3})(\d{2})(\d{2})$',
      'format': r'+998 $1 $2 $3 $4',
    },
    // Add more countries as needed
  ];

  Map<String, String>? get detectedCountry {
    for (final c in _countryPrefixes) {
      if (_input.startsWith(c['prefix'])) {
        return {
          'name': c['name'],
          'pattern': c['pattern'],
          'format': c['format'],
        };
      }
    }
    return null;
  }

  String get formattedInput {
    final country = detectedCountry;
    if (country != null) {
      final reg = RegExp(country['pattern']!);
      final match = reg.firstMatch(_input);
      if (match != null) {
        String formatted = country['format']!;
        for (int i = 1; i <= match.groupCount; i++) {
          formatted = formatted.replaceAll(' $i', match.group(i)!);
        }
        return formatted;
      }
    }
    return _input;
  }

  String? get countryName => detectedCountry?['name'];

  void _onKeyTap(String val) {
    setState(() {
      _input += val;
    });
  }

  void _onKeyLongPress(String val) {
    if (val == '0') {
      setState(() {
        _input += '+';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 66),
            // Number display
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true, // So the end of the text is visible
                  child: Column(
                    children: [
                      Text(
                        formattedInput.isEmpty ? '' : formattedInput,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              letterSpacing: 1,
                              wordSpacing: 1,
                            ),
                      ),
                      if (countryName != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            countryName!,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color
                                      ?.withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // New Contact
            ListTile(
              leading: Icon(Iconsax.profile_add, size: 28),
              title: const Text('Yangi kontakt'),
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              minLeadingWidth: 0,
            ),
            // Add to Contact
            ListTile(
              leading: Icon(Iconsax.add_circle, size: 28),
              title: const Text('Kontaktga qo‘shish'),
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              minLeadingWidth: 0,
            ),
            const SizedBox(height: 8),
            // Dial pad
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ...keys.map(
                    (row) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: row
                            .map(
                              (key) => _ClassicDialKey(
                                label: key,
                                t9: t9[key]!,
                                onTap: () => _onKeyTap(key),
                                onLongPress: () => _onKeyLongPress(key),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Action row
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                      left: 24,
                      right: 24,
                      top: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.dialpad, size: 32),
                          onPressed: () {},
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(22),
                            elevation: 0,
                          ),
                          onPressed: _input.isNotEmpty ? () {} : null,
                          child: const Icon(Icons.phone, size: 36),
                        ),
                        IconButton(
                          icon: const Icon(Icons.backspace_outlined, size: 32),
                          onPressed: _input.isNotEmpty
                              ? () => setState(
                                  () => _input = _input.substring(
                                    0,
                                    _input.length - 1,
                                  ),
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClassicDialKey extends StatelessWidget {
  final String label;
  final String t9;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  const _ClassicDialKey({
    required this.label,
    required this.t9,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(32),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Container(
          width: 72,
          height: 72,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              if (t9.isNotEmpty)
                Text(
                  t9,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Theme.of(
                      context,
                    ).textTheme.bodySmall?.color?.withOpacity(0.6),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
