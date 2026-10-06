import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../../../shared/services/providers.dart';
import '../../../../shared/widgets/auth_shell.dart';

class ForgotPasswordPage extends ConsumerWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthShell(
      title: 'Khôi phục mật khẩu',
      subtitle: 'Mã xác minh sẽ được gửi tới email đã đăng ký',
      child: Column(
        children: [
          EmailSignInWidget(
            client: ref.read(clientProvider),
            startScreen: EmailFlowScreen.requestPasswordReset,
            onAuthenticated: () async {
              await ref.read(authStateControllerProvider).refreshProfile();
            },
            onError: (error) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error.toString())),
            ),
          ),
          TextButton.icon(
            onPressed: () => context.go('/login'),
            icon: const Icon(Icons.arrow_back_rounded),
            label: const Text('Quay lại đăng nhập'),
          ),
        ],
      ),
    );
  }
}
