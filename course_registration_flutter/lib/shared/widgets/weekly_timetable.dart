import 'package:flutter/material.dart';

class TimetableEntry {
  const TimetableEntry({
    required this.dayOfWeek,
    required this.startPeriod,
    required this.endPeriod,
    required this.title,
    required this.subtitle,
    this.color,
  });

  final int dayOfWeek;
  final int startPeriod;
  final int endPeriod;
  final String title;
  final String subtitle;
  final Color? color;
}

class WeeklyTimetable extends StatefulWidget {
  const WeeklyTimetable({
    super.key,
    required this.entries,
    this.semesterStart,
    this.semesterEnd,
  });

  final List<TimetableEntry> entries;
  final DateTime? semesterStart;
  final DateTime? semesterEnd;

  @override
  State<WeeklyTimetable> createState() => _WeeklyTimetableState();
}

class _WeeklyTimetableState extends State<WeeklyTimetable> {
  late DateTime _weekStart = _monday(DateTime.now());
  late int _selectedWeekday = _initialWeekday();

  int _initialWeekday() {
    final weekday = DateTime.now().weekday;
    return weekday >= DateTime.monday && weekday <= DateTime.saturday
        ? weekday
        : DateTime.monday;
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = _weekStart.add(
      Duration(days: _selectedWeekday - DateTime.monday),
    );
    final selectedDayOfWeek = _selectedWeekday + 1;
    final entries =
        widget.entries
            .where((item) => item.dayOfWeek == selectedDayOfWeek)
            .toList()
          ..sort((a, b) => a.startPeriod.compareTo(b.startPeriod));
    final inSemester = _inSemester(selectedDate);

    return Column(
      children: [
        Card(
          margin: const EdgeInsets.fromLTRB(12, 12, 12, 8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      tooltip: 'Tuần trước',
                      onPressed: () => _moveWeek(-1),
                      icon: const Icon(Icons.chevron_left),
                    ),
                    Expanded(
                      child: Text(
                        'Tuần ${_date(_weekStart)} – '
                        '${_date(_weekStart.add(const Duration(days: 5)))}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    IconButton(
                      tooltip: 'Tuần sau',
                      onPressed: () => _moveWeek(1),
                      icon: const Icon(Icons.chevron_right),
                    ),
                  ],
                ),
                TextButton.icon(
                  onPressed: _goToCurrentWeek,
                  icon: const Icon(Icons.today_outlined),
                  label: const Text('Tuần hiện tại'),
                ),
                const SizedBox(height: 4),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var weekday = 1; weekday <= 6; weekday++) ...[
                        ChoiceChip(
                          key: Key('schedule-day-$weekday'),
                          selected: _selectedWeekday == weekday,
                          onSelected: (_) =>
                              setState(() => _selectedWeekday = weekday),
                          label: Text(
                            'Thứ ${weekday + 1}\n'
                            '${_date(_weekStart.add(Duration(days: weekday - 1)))}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (weekday < 6) const SizedBox(width: 8),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (!inSemester)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Tuần đã chọn nằm ngoài thời gian học kỳ.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        Expanded(
          child: !inSemester
              ? const Center(child: Text('Không có lịch học trong tuần này.'))
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    final period = index + 1;
                    final matches = entries
                        .where(
                          (item) =>
                              period >= item.startPeriod &&
                              period <= item.endPeriod,
                        )
                        .toList();
                    return _PeriodRow(period: period, entries: matches);
                  },
                ),
        ),
      ],
    );
  }

  bool _inSemester(DateTime value) {
    final start = widget.semesterStart;
    final end = widget.semesterEnd;
    if (start == null || end == null) return true;
    final day = DateTime(value.year, value.month, value.day);
    final first = DateTime(start.year, start.month, start.day);
    final last = DateTime(end.year, end.month, end.day);
    return !day.isBefore(first) && !day.isAfter(last);
  }

  void _moveWeek(int amount) {
    setState(() => _weekStart = _weekStart.add(Duration(days: amount * 7)));
  }

  void _goToCurrentWeek() {
    setState(() {
      _weekStart = _monday(DateTime.now());
      _selectedWeekday = _initialWeekday();
    });
  }

  static DateTime _monday(DateTime value) {
    final day = DateTime(value.year, value.month, value.day);
    return day.subtract(Duration(days: day.weekday - DateTime.monday));
  }

  static String _date(DateTime value) =>
      '${value.day.toString().padLeft(2, '0')}/'
      '${value.month.toString().padLeft(2, '0')}';
}

class _PeriodRow extends StatelessWidget {
  const _PeriodRow({required this.period, required this.entries});

  final int period;
  final List<TimetableEntry> entries;

  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(minHeight: 58),
    decoration: BoxDecoration(
      border: Border(
        left: BorderSide(color: Theme.of(context).dividerColor),
        right: BorderSide(color: Theme.of(context).dividerColor),
        bottom: BorderSide(color: Theme.of(context).dividerColor),
        top: period == 1
            ? BorderSide(color: Theme.of(context).dividerColor)
            : BorderSide.none,
      ),
    ),
    child: Row(
      children: [
        Container(
          width: 54,
          constraints: const BoxConstraints(minHeight: 58),
          alignment: Alignment.center,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Text(
            'Tiết $period',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: entries.isEmpty
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children: entries
                        .map(
                          (entry) => Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 2),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color:
                                  (entry.color ??
                                          Theme.of(context).colorScheme.primary)
                                      .withValues(alpha: 0.14),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '${entry.title}\n${entry.subtitle}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
        ),
      ],
    ),
  );
}
