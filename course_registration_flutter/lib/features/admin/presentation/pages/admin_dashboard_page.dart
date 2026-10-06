import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/services/providers.dart';
import '../../../../shared/widgets/app_navigation.dart';
import '../../../student/presentation/widgets/student_async_error.dart';
import '../providers/admin_providers.dart';

class AdminDashboardPage extends ConsumerWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => HomeBackGuard(
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Quản trị hệ thống'),
        actions: [
          AppLogoutButton(
            onLogout: () => ref.read(authStateControllerProvider).logout(),
          ),
        ],
      ),
      body: ref
          .watch(adminProvider)
          .when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, _) => StudentAsyncError(
              onRetry: () => ref.invalidate(adminProvider),
            ),
            data: (report) => ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _AdminHeader(
                  totalUsers: report.totalStudents + report.totalLecturers,
                ),
                const SizedBox(height: 16),
                LayoutBuilder(
                  builder: (context, constraints) => GridView.count(
                    crossAxisCount: constraints.maxWidth >= 900 ? 4 : 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // Give the metric labels enough vertical room when Android
                    // applies a non-integer device scale factor.
                    childAspectRatio: constraints.maxWidth < 600 ? 1.25 : 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: [
                      _Metric(
                        'Tổng sinh viên',
                        report.totalStudents,
                        Icons.school,
                      ),
                      _Metric(
                        'Tổng giảng viên',
                        report.totalLecturers,
                        Icons.person,
                      ),
                      _Metric(
                        'Số môn học',
                        report.totalCourses,
                        Icons.menu_book_outlined,
                      ),
                      _Metric(
                        'Số lớp mở',
                        report.openClasses,
                        Icons.meeting_room,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                _Menu(
                  'Người dùng',
                  Icons.manage_accounts,
                  () => context.push('/admin/users'),
                ),
                _Menu(
                  'Môn học',
                  Icons.menu_book_outlined,
                  () => context.push('/admin/courses'),
                ),
                _Menu(
                  'Đào tạo',
                  Icons.account_tree_outlined,
                  () => context.push('/admin/programs'),
                ),
                _Menu(
                  'Duyệt lớp',
                  Icons.fact_check_outlined,
                  () => context.push('/admin/approvals'),
                ),
                _Menu(
                  'Báo cáo',
                  Icons.analytics_outlined,
                  () => context.push('/admin/reports'),
                ),
                _Menu(
                  'Lịch sử',
                  Icons.history,
                  () => context.push('/admin/audit'),
                ),
              ],
            ),
          ),
    ),
  );
}

class _AdminHeader extends StatelessWidget {
  const _AdminHeader({required this.totalUsers});
  final int totalUsers;

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
          child: Icon(
            Icons.admin_panel_settings_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tổng quan hệ thống',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                '$totalUsers tài khoản đang được quản lý',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _Metric extends StatelessWidget {
  const _Metric(this.label, this.value, this.icon);
  final String label;
  final int value;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(icon),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(label, maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
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
