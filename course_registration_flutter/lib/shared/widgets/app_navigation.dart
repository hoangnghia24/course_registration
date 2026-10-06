import 'package:flutter/material.dart';

class AppLogoutButton extends StatefulWidget {
  const AppLogoutButton({required this.onLogout, super.key});

  final Future<void> Function() onLogout;

  @override
  State<AppLogoutButton> createState() => _AppLogoutButtonState();
}

class _AppLogoutButtonState extends State<AppLogoutButton> {
  bool _loading = false;

  Future<void> _logout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.logout_rounded),
        title: const Text('Xác nhận đăng xuất'),
        content: const Text(
          'Bạn có chắc muốn đăng xuất để chuyển sang tài khoản khác không?',
        ),
        actions: [
          TextButton(
            key: const Key('logout-cancel'),
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Hủy'),
          ),
          FilledButton.icon(
            key: const Key('logout-confirm'),
            onPressed: () => Navigator.pop(context, true),
            icon: const Icon(Icons.logout_rounded),
            label: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    setState(() => _loading = true);
    try {
      await widget.onLogout();
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) => IconButton(
    key: const Key('logout-button'),
    tooltip: 'Đăng xuất',
    onPressed: _loading ? null : _logout,
    icon: _loading
        ? const SizedBox.square(
            dimension: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          )
        : const Icon(Icons.logout_rounded),
  );
}

class HomeBackGuard extends StatelessWidget {
  const HomeBackGuard({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false,
    onPopInvokedWithResult: (didPop, _) {
      if (didPop) return;
      final messenger = ScaffoldMessenger.of(context);
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text(
              'Bạn đang ở trang chính. Chọn Đăng xuất để đổi tài khoản.',
            ),
            duration: Duration(seconds: 2),
          ),
        );
    },
    child: child,
  );
}
