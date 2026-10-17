import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/course_registration_providers.dart';

class RegistrationConfirmationPage extends ConsumerWidget {
  const RegistrationConfirmationPage({required this.courseClass, super.key});

  final OpenCourseClassDto courseClass;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eligibility = ref.watch(
      eligibilityProvider(courseClass.courseClassId),
    );
    final registrationOpen =
        ref.watch(registrationPeriodProvider).asData?.value.isOpen ?? false;
    return Scaffold(
      appBar: AppBar(title: const Text('Xác nhận đăng ký')),
      body: eligibility.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Không thể kiểm tra: $error')),
        data: (result) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card.filled(
              child: ListTile(
                title: Text(
                  '${courseClass.courseCode} - ${courseClass.courseName}',
                ),
                subtitle: Text(
                  '${courseClass.classCode} • ${courseClass.credits} tín chỉ\nGV ${courseClass.lecturerName}',
                ),
              ),
            ),
            const SizedBox(height: 12),
            _Check(
              label: 'Đủ điều kiện tiên quyết',
              ok: result.prerequisitePassed,
            ),
            _Check(label: 'Không trùng lịch', ok: result.scheduleAvailable),
            _Check(label: 'Còn chỗ', ok: result.capacityAvailable),
            _Check(
              label: 'Trong giới hạn tín chỉ',
              ok: result.withinCreditLimit,
            ),
            _Check(
              label: 'Thuộc chương trình đào tạo',
              ok: result.inTrainingProgram,
            ),
            if (result.messages.isNotEmpty)
              Card(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(result.messages.join('\n')),
                ),
              ),
            const SizedBox(height: 16),
            FilledButton(
              key: const Key('confirm-registration'),
              onPressed: result.eligible && registrationOpen
                  ? () => _register(context, ref)
                  : null,
              child: const Text('Xác nhận đăng ký'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _register(BuildContext context, WidgetRef ref) async {
    final result = await ref
        .read(courseRegistrationRepositoryProvider)
        .registerCourse(courseClass.courseClassId);
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(result.message)));
    if (result.success || result.errorCode == 'PENDING_SYNC') {
      ref.invalidate(openClassesProvider);
      ref.invalidate(myRegisteredCoursesProvider);
      Navigator.of(context).pop();
    }
  }
}

class _Check extends StatelessWidget {
  const _Check({required this.label, required this.ok});
  final String label;
  final bool ok;

  @override
  Widget build(BuildContext context) => ListTile(
    leading: Icon(
      ok ? Icons.check_circle : Icons.cancel,
      color: ok ? Colors.green : Theme.of(context).colorScheme.error,
    ),
    title: Text(label),
  );
}
