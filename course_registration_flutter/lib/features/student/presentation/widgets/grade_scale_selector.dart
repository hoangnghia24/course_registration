import 'package:flutter/material.dart';

import '../providers/student_providers.dart';

class GradeScaleSelector extends StatelessWidget {
  const GradeScaleSelector({
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final GradeScale selected;
  final ValueChanged<GradeScale> onSelected;

  @override
  Widget build(BuildContext context) => SegmentedButton<GradeScale>(
    key: const Key('grade-scale-selector'),
    showSelectedIcon: false,
    segments: const [
      ButtonSegment(value: GradeScale.four, label: Text('Thang 4')),
      ButtonSegment(value: GradeScale.ten, label: Text('Thang 10')),
    ],
    selected: {selected},
    onSelectionChanged: (values) => onSelected(values.single),
    style: const ButtonStyle(
      visualDensity: VisualDensity(horizontal: -3, vertical: -3),
    ),
  );
}
