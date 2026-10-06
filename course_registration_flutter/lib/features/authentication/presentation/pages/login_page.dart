import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/error_handler.dart';
import '../../../../shared/services/providers.dart';
import '../../../../shared/widgets/auth_shell.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final controller = ref.read(authStateControllerProvider);
    final success = await controller.login(_email.text, _password.text);
    if (!mounted) return;
    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(ErrorHandler.message(controller.error!))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.read(authStateControllerProvider);
    return AuthShell(
      title: 'Chào mừng trở lại',
      subtitle: 'Đăng nhập bằng tài khoản trường đại học',
      child: AnimatedBuilder(
        animation: auth,
        builder: (context, _) => Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                key: const Key('login-email'),
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email_rounded),
                ),
                validator: (value) => value != null && value.contains('@')
                    ? null
                    : 'Vui lòng nhập email hợp lệ',
              ),
              const SizedBox(height: 16),
              TextFormField(
                key: const Key('login-password'),
                controller: _password,
                obscureText: _obscure,
                autofillHints: const [AutofillHints.password],
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => _obscure = !_obscure),
                    icon: Icon(
                      _obscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                validator: (value) => (value?.length ?? 0) >= 8
                    ? null
                    : 'Mật khẩu phải có ít nhất 8 ký tự',
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: auth.loading
                      ? null
                      : () => context.go('/forgot-password'),
                  child: const Text('Quên mật khẩu?'),
                ),
              ),
              FilledButton(
                key: const Key('login-submit'),
                onPressed: auth.loading ? null : _submit,
                child: auth.loading
                    ? const SizedBox.square(
                        dimension: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Đăng nhập'),
              ),
              const SizedBox(height: 12),
              const Text(
                'Tài khoản do phòng đào tạo cấp. Liên hệ quản trị viên nếu bạn chưa có hoặc không thể đăng nhập.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
