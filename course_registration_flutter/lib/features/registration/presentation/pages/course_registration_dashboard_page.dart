import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../student/presentation/widgets/student_async_error.dart';
import '../providers/course_registration_providers.dart';

class CourseRegistrationDashboardPage extends ConsumerWidget {
  const CourseRegistrationDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final semester = ref.watch(currentSemesterProvider);
    final period = ref.watch(registrationPeriodProvider).asData?.value;
    final courses = ref.watch(myRegisteredCoursesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng ký học phần')),
      body: semester.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => StudentAsyncError(
          onRetry: () => ref.invalidate(currentSemesterProvider),
        ),
        data: (current) {
          final credits =
              courses.value?.fold<int>(
                0,
                (total, course) => total + course.credits,
              ) ??
              0;
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(currentSemesterProvider);
              ref.invalidate(myRegisteredCoursesProvider);
              await ref.read(currentSemesterProvider.future);
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: [
                Card.filled(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Học kỳ hiện tại',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          '${current.name} - ${current.academicYear}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 14),
                        Text('Tín chỉ đã đăng ký: $credits/25'),
                        const SizedBox(height: 10),
                        _PeriodMessage(period: period),
                        const SizedBox(height: 6),
                        LinearProgressIndicator(
                          value: (credits / 25).clamp(0, 1),
                        ),
                        if (credits < 10) ...[
                          const SizedBox(height: 8),
                          const Text('Cần tối thiểu 10 tín chỉ cho học kỳ.'),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _Action(
                  icon: Icons.search,
                  label: 'Đăng ký học phần',
                  onTap: period?.isOpen == true
                      ? () => context.push('/student/registration/search')
                      : null,
                ),
                _Action(
                  icon: Icons.playlist_add_check,
                  label: 'Danh sách đã đăng ký',
                  onTap: () => context.push('/student/registration/my-courses'),
                ),
                _Action(
                  icon: Icons.calendar_month_outlined,
                  label: 'Lịch học',
                  onTap: () => context.push('/student/registration/schedule'),
                ),
                _Action(
                  icon: Icons.account_tree_outlined,
                  label: 'Chương trình đào tạo',
                  onTap: () => context.push('/student/program'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Action extends StatelessWidget {
  const _Action({required this.icon, required this.label, required this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: FilledButton.tonalIcon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Align(alignment: Alignment.centerLeft, child: Text(label)),
    ),
  );
}

class _PeriodMessage extends StatelessWidget {
  const _PeriodMessage({required this.period});

  final RegistrationPeriodDto? period;

  @override
  Widget build(BuildContext context) {
    final value = period;
    if (value == null) return const Text('Đang tải thời gian đăng ký...');
    final now = DateTime.now().toUtc();
    if (now.isBefore(value.startTime.toUtc())) {
      return Text(
        'Đăng ký học phần sẽ bắt đầu vào ${_format(value.startTime.toLocal())}.',
      );
    }
    if (now.isAfter(value.endTime.toUtc())) {
      return Text(
        'Thời gian đăng ký học phần đã kết thúc lúc ${_format(value.endTime.toLocal())}.',
      );
    }
    if (!value.isOpen) {
      return const Text('Học kỳ hiện không mở đăng ký học phần.');
    }
    return Text(
      'Đang trong thời gian đăng ký học phần. Kết thúc: ${_format(value.endTime.toLocal())}.',
    );
  }

  static String _format(DateTime value) =>
      '${value.day.toString().padLeft(2, '0')}/'
      '${value.month.toString().padLeft(2, '0')}/${value.year} '
      '${value.hour.toString().padLeft(2, '0')}:'
      '${value.minute.toString().padLeft(2, '0')}';
}
