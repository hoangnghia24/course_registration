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
  Widget build(BuildContext context) => Wrap(
    key: const Key('grade-scale-selector'),
    spacing: 6,
    runSpacing: 6,
    children: [
      _ScaleChip(
        label: 'Thang 4',
        selected: selected == GradeScale.four,
        onSelected: () => onSelected(GradeScale.four),
      ),
      _ScaleChip(
        label: 'Thang 10',
        selected: selected == GradeScale.ten,
        onSelected: () => onSelected(GradeScale.ten),
      ),
    ],
  );
}

class _ScaleChip extends StatelessWidget {
  const _ScaleChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) => ChoiceChip(
    label: Text(label),
    selected: selected,
    showCheckmark: false,
    visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
    onSelected: (value) {
      if (value) onSelected();
    },
  );
}
