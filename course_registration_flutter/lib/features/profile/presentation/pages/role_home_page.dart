import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/services/providers.dart';

class RoleHomePage extends ConsumerWidget {
  const RoleHomePage({required this.roleLabel, super.key});
  final String roleLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authStateControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Không gian $roleLabel'),
        actions: [
          IconButton(
            tooltip: 'Đăng xuất',
            onPressed: auth.logout,
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.verified_user_rounded, size: 64),
              const SizedBox(height: 16),
              Text(
                'Xin chào ${auth.profile?.fullName ?? ''}',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text('Đã xác thực với quyền $roleLabel'),
              const SizedBox(height: 16),
              const Text(
                'Các chức năng nghiệp vụ sẽ được triển khai từ Phase 3.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
