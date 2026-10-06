import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/lecturer_providers.dart';

class LecturerProfilePage extends ConsumerWidget {
  const LecturerProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: const Text('Hồ sơ giảng viên')),
    body: ref
        .watch(lecturerProvider)
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('$error')),
          data: (item) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const CircleAvatar(
                radius: 46,
                child: Icon(Icons.person, size: 46),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Họ tên'),
                subtitle: Text(item.fullName),
              ),
              ListTile(
                title: const Text('Mã giảng viên'),
                subtitle: Text(item.lecturerCode),
              ),
              ListTile(title: const Text('Email'), subtitle: Text(item.email)),
              ListTile(
                title: const Text('Khoa'),
                subtitle: Text(item.facultyName ?? 'Chưa cập nhật'),
              ),
              ListTile(
                title: const Text('Bộ môn'),
                subtitle: Text(item.department ?? 'Chưa cập nhật'),
              ),
              ListTile(
                title: const Text('Học hàm'),
                subtitle: Text(item.academicTitle ?? 'Chưa cập nhật'),
              ),
              ListTile(
                title: const Text('Chuyên môn'),
                subtitle: Text(item.specialization ?? 'Chưa cập nhật'),
              ),
            ],
          ),
        ),
  );
}
