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
        title: Text(
          'Call History',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
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
          // TODO: Implement new call action
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
