import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/services/providers.dart';
import '../../../../shared/widgets/app_navigation.dart';
import '../../../student/presentation/widgets/student_async_error.dart';
import '../providers/lecturer_providers.dart';

class LecturerDashboardPage extends ConsumerWidget {
  const LecturerDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(lecturerProvider);
    final classes = ref.watch(courseClassProvider);
    final schedule = ref.watch(scheduleProvider);
    return HomeBackGuard(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trang giảng viên'),
          actions: [
            IconButton(
              tooltip: 'Hồ sơ giảng viên',
              onPressed: () => context.push('/lecturer/profile'),
              icon: const Icon(Icons.account_circle_outlined),
            ),
            AppLogoutButton(
              onLogout: () => ref.read(authStateControllerProvider).logout(),
            ),
          ],
        ),
        body: profile.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, _) => StudentAsyncError(
            onRetry: () => ref.invalidate(lecturerProvider),
          ),
          data: (lecturer) {
            final classValues = classes.value ?? const [];
            final studentCount = classValues.fold<int>(
              0,
              (total, item) => total + item.registeredCount,
            );
            final today = DateTime.now().weekday + 1;
            final todayCount =
                schedule.value
                    ?.where((item) => item.dayOfWeek == today)
                    .length ??
                0;
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _WelcomeCard(name: lecturer.fullName),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _Metric(
                      label: 'Lớp đang dạy',
                      value: '${classValues.length}',
                    ),
                    _Metric(label: 'Sinh viên', value: '$studentCount'),
                    _Metric(label: 'Lịch hôm nay', value: '$todayCount'),
                  ],
                ),
                const SizedBox(height: 16),
                _Menu('Quản lý lớp', Icons.school_outlined, () {
                  context.push('/lecturer/classes');
                }),
                _Menu('Thời khóa biểu', Icons.calendar_month_outlined, () {
                  context.push('/lecturer/schedule');
                }),
                _Menu('Sinh viên', Icons.groups_outlined, () {
                  context.push('/lecturer/classes');
                }),
                _Menu('Nhu cầu mở lớp', Icons.bar_chart, () {
                  context.push('/lecturer/demand');
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.tertiary,
        ],
      ),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white24,
          child: Icon(Icons.co_present_rounded, color: Colors.white, size: 31),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Xin chào, $name',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Text(
                'Không gian quản lý giảng dạy',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Column(
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    ),
  );
}

class _Menu extends StatelessWidget {
  const _Menu(this.label, this.icon, this.onTap);
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        minTileHeight: 64,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          foregroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(icon),
        ),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
        onTap: onTap,
      ),
    ),
  );
}
