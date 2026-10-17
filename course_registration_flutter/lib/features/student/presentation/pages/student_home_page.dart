import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/services/providers.dart';
import '../../../../shared/widgets/app_navigation.dart';
import '../providers/student_providers.dart';
import '../widgets/grade_scale_selector.dart';
import '../widgets/student_async_error.dart';

class StudentHomePage extends ConsumerWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(studentProfileProvider);
    final gpa = ref.watch(gpaProvider);
    final gradeScale = ref.watch(gradeScaleProvider);
    return HomeBackGuard(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trang sinh viên'),
          actions: [
            AppLogoutButton(
              onLogout: () => ref.read(authStateControllerProvider).logout(),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(studentProfileProvider);
            ref.invalidate(gpaProvider);
            await ref.read(studentProfileProvider.future);
          },
          child: profile.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, _) => StudentAsyncError(
              onRetry: () => ref.invalidate(studentProfileProvider),
            ),
            data: (student) => ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.tertiary,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.22),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 29,
                        backgroundColor: Colors.white24,
                        child: Icon(
                          Icons.school_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Xin chào,',
                              style: TextStyle(color: Colors.white70),
                            ),
                            Text(
                              student.fullName,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            Text(
                              student.studentCode,
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final title = Text(
                              'Kết quả học tập',
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                            );
                            final selector = GradeScaleSelector(
                              selected: gradeScale,
                              onSelected: ref
                                  .read(gradeScaleProvider.notifier)
                                  .select,
                            );
                            if (constraints.maxWidth < 280) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  title,
                                  const SizedBox(height: 8),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: selector,
                                  ),
                                ],
                              );
                            }
                            return Row(
                              children: [
                                Expanded(child: title),
                                selector,
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 4),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final score = Text(
                              gradeScale
                                  .fromFourPoint(
                                    gpa.value?.cumulativeGpa ?? student.gpa,
                                  )
                                  .toStringAsFixed(2),
                              style: Theme.of(context).textTheme.displaySmall
                                  ?.copyWith(fontWeight: FontWeight.w800),
                            );
                            final caption = Text(
                              'GPA / ${gradeScale.maximum}',
                            );
                            if (constraints.maxWidth < 280) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [score, caption],
                              );
                            }
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                score,
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8,
                                    left: 5,
                                  ),
                                  child: caption,
                                ),
                              ],
                            );
                          },
                        ),
                        const Divider(height: 28),
                        Text(
                          'Tín chỉ: ${gpa.value?.earnedCredits ?? student.totalCredits}/${student.programTotalCredits}',
                        ),
                        const SizedBox(height: 6),
                        Text('Ngành: ${student.majorName}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _DestinationButton(
                  icon: Icons.badge_outlined,
                  label: 'Hồ sơ cá nhân',
                  onPressed: () => context.push('/student/profile'),
                ),
                _DestinationButton(
                  icon: Icons.account_tree_outlined,
                  label: 'Chương trình đào tạo',
                  onPressed: () => context.push('/student/program'),
                ),
                _DestinationButton(
                  icon: Icons.table_chart_outlined,
                  label: 'Bảng điểm',
                  onPressed: () => context.push('/student/transcript'),
                ),
                _DestinationButton(
                  icon: Icons.app_registration,
                  label: 'Đăng ký học phần',
                  onPressed: () => context.push('/student/registration'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DestinationButton extends StatelessWidget {
  const _DestinationButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        minTileHeight: 66,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          foregroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(icon),
        ),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
        onTap: onPressed,
      ),
    ),
  );
}
