import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/app_labels.dart';
import '../providers/admin_providers.dart';

class UserManagementPage extends ConsumerStatefulWidget {
  const UserManagementPage({super.key});
  @override
  ConsumerState<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends ConsumerState<UserManagementPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 3, vsync: this);
  String _query = '';
  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Quản lý người dùng'),
      bottom: TabBar(
        controller: _tabs,
        tabs: const [
          Tab(text: 'Sinh viên'),
          Tab(text: 'Giảng viên'),
          Tab(text: 'Quản trị'),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () => _showUserDialog(),
      icon: const Icon(Icons.person_add),
      label: const Text('Tạo tài khoản'),
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            key: const Key('admin-user-search'),
            onChanged: (value) => setState(() => _query = value.toLowerCase()),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: 'Tìm kiếm',
            ),
          ),
        ),
        Expanded(
          child: ref
              .watch(userManagementProvider)
              .when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(child: Text('$error')),
                data: (users) => TabBarView(
                  controller: _tabs,
                  children: [
                    _list(users, UserRole.student),
                    _list(users, UserRole.lecturer),
                    _list(users, UserRole.admin),
                  ],
                ),
              ),
        ),
      ],
    ),
  );

  Widget _list(List<AdminUserDto> users, UserRole role) {
    final values = users
        .where(
          (item) =>
              item.role == role &&
              (item.fullName.toLowerCase().contains(_query) ||
                  item.email.toLowerCase().contains(_query)),
        )
        .toList();
    if (values.isEmpty) {
      return const Center(child: Text('Không có người dùng phù hợp.'));
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 96),
      itemCount: values.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final item = values[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      item.isActive ? Icons.account_circle : Icons.person_off,
                      size: 30,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.fullName,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 2),
                          Text(item.email),
                          Text(
                            item.roleCode == null
                                ? AppLabels.userRole(item.role)
                                : '${AppLabels.userRole(item.role)} • ${item.roleCode}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    spacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      IconButton(
                        tooltip: 'Chỉnh sửa',
                        onPressed: () => _showUserDialog(user: item),
                        icon: const Icon(Icons.edit),
                      ),
                      if (item.isActive)
                        TextButton(
                          onPressed: () => _disableUser(item),
                          child: const Text('Vô hiệu hóa'),
                        )
                      else
                        const Chip(label: Text('Đã vô hiệu hóa')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _disableUser(AdminUserDto user) async {
    try {
      await ref.read(adminRepositoryProvider).disableUser(user.userId);
      final _ = await ref.refresh(userManagementProvider.future);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đã vô hiệu hóa ${user.fullName}.')),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Không thể cập nhật người dùng.')),
        );
      }
    }
  }

  Future<void> _showUserDialog({AdminUserDto? user}) async {
    final formKey = GlobalKey<FormState>();
    final email = TextEditingController(text: user?.email);
    final password = TextEditingController();
    final fullName = TextEditingController(text: user?.fullName);
    final phone = TextEditingController(text: user?.phone);
    final roleCode = TextEditingController(text: user?.roleCode);
    var role = user?.role ?? UserRole.student;
    final saved = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          title: Text(user == null ? 'Tạo tài khoản' : 'Chỉnh sửa tài khoản'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: email,
                    enabled: user == null,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) => (value?.contains('@') ?? false)
                        ? null
                        : 'Email không hợp lệ',
                  ),
                  const SizedBox(height: 12),
                  if (user == null) ...[
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Mật khẩu ban đầu',
                      ),
                      validator: (value) => (value?.length ?? 0) >= 8
                          ? null
                          : 'Mật khẩu phải có ít nhất 8 ký tự',
                    ),
                    const SizedBox(height: 12),
                  ],
                  TextFormField(
                    controller: fullName,
                    decoration: const InputDecoration(labelText: 'Họ tên'),
                    validator: (value) =>
                        (value?.trim().isEmpty ?? true) ? 'Bắt buộc' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: user == null ? roleCode : phone,
                    decoration: InputDecoration(
                      labelText: user == null ? 'Mã vai trò' : 'Điện thoại',
                    ),
                  ),
                  if (user == null) const SizedBox(height: 12),
                  if (user == null)
                    DropdownButtonFormField<UserRole>(
                      initialValue: role,
                      decoration: const InputDecoration(labelText: 'Vai trò'),
                      items: UserRole.values
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(AppLabels.userRole(value)),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => setDialogState(() => role = value!),
                    ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Hủy'),
            ),
            FilledButton(
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;
                try {
                  final repository = ref.read(adminRepositoryProvider);
                  if (user == null) {
                    await repository.createUser(
                      email: email.text.trim(),
                      password: password.text,
                      fullName: fullName.text.trim(),
                      role: role,
                      roleCode: roleCode.text.trim().isEmpty
                          ? null
                          : roleCode.text.trim(),
                    );
                  } else {
                    await repository.updateUser(
                      user.userId,
                      fullName.text.trim(),
                      phone.text.trim(),
                    );
                  }
                  if (context.mounted) Navigator.pop(context, true);
                } catch (_) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Không thể lưu tài khoản.')),
                    );
                  }
                }
              },
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
    email.dispose();
    password.dispose();
    fullName.dispose();
    phone.dispose();
    roleCode.dispose();
    if (saved == true) {
      try {
        final _ = await ref.refresh(userManagementProvider.future);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đã lưu tài khoản.')),
          );
        }
      } catch (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đã lưu nhưng không thể tải lại dữ liệu.'),
            ),
          );
        }
      }
    }
  }
}
