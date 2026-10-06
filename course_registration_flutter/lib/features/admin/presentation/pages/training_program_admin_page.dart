import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/admin_providers.dart';

class TrainingProgramAdminPage extends ConsumerWidget {
  const TrainingProgramAdminPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final majors = ref.watch(majorsAdminProvider);
    final programs = ref.watch(trainingProgramsAdminProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Chương trình đào tạo')),
      body: majors.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('$error')),
        data: (majorItems) => programs.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('$error')),
          data: (programItems) => ListView(
            padding: const EdgeInsets.all(12),
            children: majorItems
                .map(
                  (major) => ExpansionTile(
                    leading: const Icon(Icons.account_tree),
                    title: Text(major.name),
                    subtitle: Text(major.code),
                    children: programItems
                        .where((item) => item.majorId == major.id)
                        .map(
                          (program) => ListTile(
                            contentPadding: const EdgeInsets.only(
                              left: 48,
                              right: 16,
                            ),
                            leading: const Icon(Icons.schema),
                            title: Text(program.name),
                            subtitle: Text(
                              '${program.academicYear} • ${program.totalCredits} tín chỉ',
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
